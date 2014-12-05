package model;

public class ModelsAndFeatures {
	
	private int ModelId;
	private int FeatureId;
	
	public int getModelId() {
		return ModelId;
	}
	public void setModelId(int modelId) {
		ModelId = modelId;
	}
	public int getFeatureId() {
		return FeatureId;
	}
	public void setFeatureId(int featureId) {
		FeatureId = featureId;
	}
	public ModelsAndFeatures(int modelId, int featureId) {
		super();
		ModelId = modelId;
		FeatureId = featureId;
	}
	public ModelsAndFeatures() {
		super();
	}
	
	

}
