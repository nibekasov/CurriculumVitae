# Import required libraries
import pandas as pd
from bokeh.plotting import figure
from bokeh.io import output_file, show

nba = pd.read_csv("nba.csv")

# Create a new figure
fig = figure(x_axis_label="Blocks per Game", y_axis_label="Rebounds per Game")

# Add circle glyphs
fig.circle(x=nba["blocks"], y=nba["rebounds"])

# Kevin Durant Performance
kevin_durant = nba[nba.player == "Kevin Durant"]

# Call function to produce html file and display plot
output_file(filename="my_first_plot.html")
show(fig)

# Create figure
fig = figure(x_axis_label="Season", y_axis_label="Points")

# Add line glyphs
fig.line(x=kevin_durant["season"], y=kevin_durant["points"])

# Generate HTML file
output_file(filname="Kevin_Durant_preformance.html")

# Display plot
show(fig)


# Calculate average three point field goal percentage by position
positions = nba.groupby("position", as_index=False)["three_point_perc"].mean()

# Instantiate figure
fig = figure(x_axis_label="Position", y_axis_label="3 Point Field Goal (%)", x_range=positions["position"]) 

# Add bars
fig.vbar(x=positions["position"], top=positions["three_point_perc"])

# Produce the html file and display the plot
output_file(filename="3p_fg_by_position.html")
show(fig)
