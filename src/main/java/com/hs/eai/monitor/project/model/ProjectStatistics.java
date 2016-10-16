package com.hs.eai.monitor.project.model;

import java.io.Serializable;
import com.hs.eai.monitor.project.model.dto.ProjectDto;

public class ProjectStatistics implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private ProjectDto ProjectDto;
	private String percentOpenIssues;
	private String percentReopenIssues;
	private String percentResolved;
	private String percentClosed;
	private String inprogressIssues;
	private String percentCompletedIssues;
	

	public String getPercentCompletedIssues() {
		return percentCompletedIssues;
	}

	public void setPercentCompletedIssues(String percentCompletedIssues) {
		this.percentCompletedIssues = percentCompletedIssues;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ProjectStatistics(ProjectDto ProjectDto) {
		this.ProjectDto = ProjectDto;
	}

	public ProjectDto getProjectDto() {
		return ProjectDto;
	}

	public void setProjectDto(ProjectDto ProjectDto) {
		this.ProjectDto = ProjectDto;
	}

	public String getPercentOpenIssues() {
		return percentOpenIssues;
	}

	public void setPercentOpenIssues(String percentOpenIssues) {
		this.percentOpenIssues = percentOpenIssues;
	}

	public String getPercentReopenIssues() {
		return percentReopenIssues;
	}

	public void setPercentReopenIssues(String percentReopenIssues) {
		this.percentReopenIssues = percentReopenIssues;
	}

	public String getPercentResolved() {
		return percentResolved;
	}

	public void setPercentResolved(String percentResolved) {
		this.percentResolved = percentResolved;
	}

	public String getPercentClosed() {
		return percentClosed;
	}

	public void setPercentClosed(String percentClosed) {
		this.percentClosed = percentClosed;
	}

	public String getInprogressIssues() {
		return inprogressIssues;
	}

	public void setInprogressIssues(String inprogressIssues) {
		this.inprogressIssues = inprogressIssues;
	}

}
