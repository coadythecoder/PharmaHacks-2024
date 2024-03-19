# Load library
library(Seurat)
library(scFeatures)

# Load first dataset
rna_data <- readRDS("seurat_data.rds")
rna_data = UpdateSeuratObject(object=rna_data)

# Load features ["proportion_ratio", "proportion_logit", "pathway_gsva", 
# "pathway_mean", "gene_mean_aggregated", "gene_mean_celltype"]
data <- rna_data@assays$RNA@data
celltype <- rna_data$id.celltype
sample <- rna_data$sampleID
scFeatures <- scFeatures(data, celltype = celltype, sample = sample, type = "scrna",
                         feature_types = c("proportion_ratio", "proportion_logit", "pathway_gsva", 
                                           "pathway_mean", "gene_mean_aggregated", "gene_mean_celltype"))


# Write extracted individual features to csv for further analysis in python.
write.csv(scFeatures$proportion_ratio, "/Volumes/EXTERNAL/proportion_ratio.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures$proportion_logit, "/Volumes/EXTERNAL/proportion_logit.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures$pathway_mean, "/Volumes/EXTERNAL/pathway_mean.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures$gene_mean_bulk, "/Volumes/EXTERNAL/gene_mean_bulk.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures$gene_mean_celltype, "/Volumes/EXTERNAL/gene_mean_celltype.csv", row.names=TRUE, col.names=TRUE)
# Additional features
scFeatures <- scFeatures(data, celltype = celltype, sample = sample, type = "scrna",
                         feature_types = c("proportion_raw","gene_prop_celltype"))
write.csv(scFeatures$proportion_raw, "./proportion_raw.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures$gene_prop_celltype, "./gene_proportion_celltype.csv", row.names=TRUE, col.names=TRUE)

# Write sampleIDs matched to patient names and outcomes to extract patient ID -> outcome in python.
patient_outcomes <- rna_data$group_per_sample
patient_names <- rna_data$sampleID
write.csv(patient_outcomes, "./patient_outcomes.csv", row.names=TRUE, col.names=TRUE)
write.csv(patient_names, "/Volumes/EXTERNAL/patient_names.csv", row.names=TRUE, col.names=TRUE)

rna_data2@assays$RNA


# Load second dataset
rna_data2 <- readRDS("stephenson.rds")
#rna_data2 = UpdateSeuratObject(object=rna_data2)

# Load features ["proportion_ratio", "proportion_logit", "pathway_gsva", 
# "pathway_mean", "gene_mean_aggregated", "gene_mean_celltype"]
data2 <- rna_data2@assays$RNA@layers$counts
sample2 <- rna_data2$sample_id
celltype2 <- rna_data2$full_clustering
#celltype2 <- rna_data2$initial_clustering
scFeatures3 <- scFeatures(data2, celltype = celltype2, sample=sample2, type="scrna", feature_types = c("proportion_ratio", "proportion_logit", "pathway_gsva", 
    "pathway_mean", "gene_mean_aggregated", "gene_mean_celltype"))

write.csv(scFeatures3$proportion_ratio, "/Volumes/EXTERNAL/proportion_ratio2.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures3$proportion_logit, "/Volumes/EXTERNAL/proportion_logit2.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures3$pathway_mean, "/Volumes/EXTERNAL/pathway_mean2.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures3$gene_mean_bulk, "/Volumes/EXTERNAL/gene_mean_bulk.csv", row.names=TRUE, col.names=TRUE)
write.csv(scFeatures3$gene_mean_celltype, "/Volumes/EXTERNAL/gene_mean_celltype.csv", row.names=TRUE, col.names=TRUE)

patient_outcomes <- rna_data2$Worst_Clinical_Status
patient_names <- rna_data2$patient_id
write.csv(patient_outcomes, "/Volumes/EXTERNAL/patient_outcomes2.csv", row.names=TRUE, col.names=TRUE)
write.csv(patient_names, "/Volumes/EXTERNAL/patient_names.csv", row.names=TRUE, col.names=TRUE)


