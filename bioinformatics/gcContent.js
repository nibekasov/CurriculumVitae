function calculateGCContent(dnaString) {
    const totalLength = dnaString.length;
    let gcCount = 0;
    for (const symbol of dnaString) {
        if (symbol === 'G' || symbol === 'C') {
            gcCount++;
        }
    }
    return (gcCount / totalLength) * 100;
}

function findHighestGCContent(strings) {
    let highestGCContent = 0;
    let highestGCId = '';

    for (const stringInfo of strings) {
        const [id, dnaString] = stringInfo;
        const gcContent = calculateGCContent(dnaString);
        if (gcContent > highestGCContent) {
            highestGCContent = gcContent;
            highestGCId = id;
        }
    }

    return [highestGCId, highestGCContent.toFixed(6)];
}


// Sample dataset (array of [ID, DNA string] pairs)
const dnaStrings = [
    ["Rosalind_6404", "CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC TCCCACTAATAATTCTGAGG"],
    ["Rosalind_5959", "CCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT ATATCCATTTGTCAGCAGACACGC"],
    ["Rosalind_0808", "CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC TGGGAACCTGCGGGCAGTAGGTGGAAT"]
];

// Find the highest GC content and its corresponding ID
const result = findHighestGCContent(dnaStrings);

// Output the result
console.log(result.join("\n"));
