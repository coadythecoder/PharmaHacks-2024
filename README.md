# COVID-19 Patient Outcome Predictor (2024 McGill PharmaHacks Winner)

## Description

This project focuses on predicting the outcomes of COVID-19 patients (mild/moderate vs. severe/critical) based on their single-cell RNA (scRNA) expression data. Utilizing a dataset of 100k cells from COVID-19 patients with mild to moderate outcomes, our approach leverages the `scFeatures` R package to aggregate and summarize the data by patient. Key analyses include proportion ratios of frequency between cell pairs and gene mean bulk, which aid in identifying crucial features. These insights are then applied to train a K-Nearest Neighbors (KNN) classifier for patient outcome prediction, following the methodology outlined by Cao et al. and using the dataset provided by Schulte-Schrepping et al.

## Usage

While the project is not designed for interactive use, users are encouraged to experiment by modifying the machine learning models and evaluation metrics to potentially enhance the predictive accuracy. The initial setup includes a KNN classifier, but exploring alternatives and adjusting parameters may yield improved results.

## Contributing

Contributions are not currently being sought for this project, but feedback on the methodology and results is always welcome.

## Credits

This project was inspired by the benchmarking paper by Y. Cao, S. Ghazanfar, P. Yang, and J. Yang, titled "Benchmarking of analytical combinations for COVID-19 outcome prediction using single-cell RNA sequencing data," published in Briefings in Bioinformatics, vol. 24, no. 3, p. bbad159, 2023, DOI: 10.1093/bib/bbad159. The foundational methodology and the `scFeatures` R package provided by this paper were instrumental in the development of our predictive model. I completed this project with the invaluable support of my teammates Alex Lee and Bilal Afzal

## License

This project is open-source and available for educational and research purposes.

