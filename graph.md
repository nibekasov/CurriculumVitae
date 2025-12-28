flowchart TB
  %% =============== ONLINE PATH ===============
  subgraph O[ONLINE / REAL-TIME DECISION (p95 30-80ms)]
    CH[Client: App/Web/POS] -->|request: user_id + context| GW[API Gateway]
    GW --> PE[Promo Engine API]

    %% Feature fetch
    PE -->|get online features| OFS[Online Feature Store\n(Redis / Aerospike / KV)]
    PE -->|get eligible promos| RE[Rule / Eligibility Engine]
    PE -->|budget check & caps| BS[Budget & Caps Service]

    %% Candidates + scoring
    RE --> EP[(Eligible Promos List)]
    BS --> EP
    OFS --> SC[Scoring Service\n(gRPC/HTTP, CPU/GPU optional)]
    EP --> SC

    %% Decision
    SC --> DL[Decision Layer\nconstraints + do-no-harm + explore]
    DL -->|selected_promo_id / no_promo| PE
    PE -->|response| GW --> CH

    %% Logging
    DL -->|decision log + feature snapshot + model_version| LOG[Event Producer]
    LOG --> KAFKA[(Kafka / Pulsar)]
  end

  %% =============== EVENTING / STREAMING ===============
  subgraph S[EVENT STREAMING]
    POS[POS / Checks] --> KAFKA
    ECOM[E-com events\n(view/click/cart/purchase)] --> KAFKA
    EXP[Promo exposure / redemption] --> KAFKA
    INV[Prices / Inventory / Assortment] --> KAFKA
    REF[Reference data\n(categories/brands/stores/calendar)] --> KAFKA
  end

  %% =============== DATA LAKE / DWH ===============
  subgraph D[DATA PLATFORM]
    KAFKA -->|stream ingest| ST[Stream Processing\n(Flink / Spark Streaming)]
    ST -->|clean/enrich| DLK[Data Lake\n(S3/HDFS)]
    ST -->|aggregates| DWH[DWH / OLAP\n(ClickHouse/GP/BQ)]
    DLK --> DP[Dataset Builder / Labeling\n(user-day / exposure)]
    DWH --> DP
  end

  %% =============== FEATURE STORE ===============
  subgraph F[FEATURE STORE]
    DP --> OFT[Offline Feature Store\n(Parquet/Delta/Iceberg)]
    OFT -->|publish| OFS
    ST -->|real-time aggregates\n(promo_last_7d etc.)| OFS
  end

  %% =============== TRAINING / REGISTRY / DEPLOY ===============
  subgraph M[ML TRAINING + DEPLOYMENT]
    OFT --> TR[Training Pipeline\n(Airflow/Argo)]
    TR --> VAL[Offline Eval\n(AUUC/Qini, calibration, сегменты)]
    VAL --> MR[Model Registry\n(MLflow/SageMaker/Custom)]
    MR --> CD[CI/CD Deploy\n(Canary/A-B/Shadow)]
    CD --> SC
  end

  %% =============== ONLINE EXPERIMENTS ===============
  subgraph X[EXPERIMENTATION]
    DL --> AB[A/B Assignment\n(control holdout / randomized eligible)]
    AB -->|assignment id| LOG
    KAFKA --> EXPW[Experiment Warehouse\nmetrics + guardrails]
    EXPW --> DS[Data Science Analysis\nincremental lift]
  end

  %% =============== MONITORING ===============
  subgraph MON[MONITORING & ALERTING]
    KAFKA --> MONS[Metrics/Logs/Traces\n(Prometheus/Grafana/ELK/Jaeger)]
    OFS --> MONS
    SC --> MONS
    DWH --> MONB[Business Monitoring\n(spend, ROI, fatigue, cannibal proxy)]
    MONS --> AL[Alerts\n(PagerDuty/Slack)]
    MONB --> AL
  end
