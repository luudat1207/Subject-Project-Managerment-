/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author buitr
 */
public class FeatureList {
    int feature_id;
    String feature;
    int team;
    int status;
    String classs;
    String trainer;
    String subject;
    String description;

    public FeatureList() {
    }

    public FeatureList(int feature_id, String feature, int team, int status, String classs, String trainer, String subject, String description) {
        this.feature_id = feature_id;
        this.feature = feature;
        this.team = team;
        this.status = status;
        this.classs = classs;
        this.trainer = trainer;
        this.subject = subject;
        this.description = description;
    }

    public FeatureList(int feature_id, String feature, int team, int status, String classs, String trainer, String subject) {
        this.feature_id = feature_id;
        this.feature = feature;
        this.team = team;
        this.status = status;
        this.classs = classs;
        this.trainer = trainer;
        this.subject = subject;
    }

    public int getFeature_id() {
        return feature_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setFeature_id(int feature_id) {
        this.feature_id = feature_id;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public int getTeam() {
        return team;
    }

    public void setTeam(int team) {
        this.team = team;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getClasss() {
        return classs;
    }

    public void setClasss(String classs) {
        this.classs = classs;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "FeatureList{" + "feature_id=" + feature_id + ", feature=" + feature + ", team=" + team + ", status=" + status + ", classs=" + classs + ", trainer=" + trainer + ", subject=" + subject + '}';
    }

   
}
