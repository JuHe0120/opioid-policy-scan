**Meta Data Name**: Normalized Difference Vegetation Index (NDVI)  
**Last Modified**: Dec 3, 2021  
**Added to OEPS**: April 1, 2022  
**Author**: Michelle Stuhlmacher, DePaul University, Department of Geography; Susan Paykin, University of Chicago, Center for Spatial Data Science

### Data Location: 
BE06 - Normalized Difference Vegetation Index (NDVI) for US-wide at the Census tract, zip code, county, and state scales. File can be found [here](/data_final).
* BE06_NDVI_T 
* BE06_NDVI_Z
* BE06_NDVI_C
* BE06_NDVI_S

### Data Source(s) Description:  
Tract-level data was sourced from Sentinel 2 MSI: MultiSpectral Instrument, Level-1 C. It was calculated using imagery from the summer of 2018. Summer is defined as 03/20/2018 to 09/22/2018 (spring to fall solstice). The tract-level dataset was provided by Dr. Michelle Stuhmacher, Assistant Professor, DePaul University Department of Geography. 

### Description of Data Processing: 
The tract-level data processing was done by the Depaul University team. Sentinel-2 imagery is filtered to the desired date range and then pixels with high cloud and cirrus interference are removed. The remaining pixels are composited using the 50th percentile to produce a single image with minimal cloud interference. The NDVI is calculated using this image, and the mean NDVI values for each census tract is extracted.  

Analysis was completed using [Google Earth Engine](https://earthengine.google.com/). The code is publicly accessible to those with an Earth Engine account here: https://code.earthengine.google.com/4c997cd30d088e97d24171d528e4749b   

The key variable in this dataset is **ndvi**: the average Normalized Difference Vegetation Index (ndvi) value from all pixel values in each census tract. NDVI is a remotely sensed measure of relative vegetation abundance and health using the difference in red (RED) and near-infrared (NIR) measurements. It is calculated: *NDVI = (NIR-RED)/(NIR+RED)*  
The NDVI calculation produces an index from -1 to 1, with values at the higher end of the range corresponding to greater vegetation abundance.  

The original spatial scale was 10m pixels, which was translated to US Census tracts. 

Tract-level estimates were then aggregated to the county-level average and state-level average using their FIPS Codes. Zip code-level estimates were calculated using the [HUD USPS ZIP Code Crosswalk File](https://www.huduser.gov/portal/datasets/usps_crosswalk.html) (Tract-Zip), also provided in the OEPS under [geometryFiles/crosswalk](https://github.com/GeoDaCenter/opioid-policy-scan/tree/master/data_final/geometryFiles/crosswalk). Data processing was done by the CSDS team. 

### Key Variable and Definitions:
| Variable | Variable ID in .csv | Description |
|:---------|:--------------------|:------------|
|Normalized Difference Vegetation Index (NDVI) | ndvi | Average NDVI value from all pixel values in each Census tract |

### Data Limitations:
Despite removing identified influences of cloud interferences, there may still be clouds or other atmospheric conditions that alter pixel values used in calculations. See the original source for greater documentation of these effects. Furthermore, summarizing NDVI to the census tract simplifies inter-census tract variability.

### Comments/Notes:
No additional comments at this time. 
