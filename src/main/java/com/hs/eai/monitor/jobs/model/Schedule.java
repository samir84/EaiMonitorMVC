package com.hs.eai.monitor.jobs.model;

// Generated 2-jul-2012 15:30:42 by Hibernate Tools 3.4.0.CR1

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Schedule generated by hbm2java
 */
@SuppressWarnings("serial")
public class Schedule implements java.io.Serializable {

	private int id;
	private ProcessingDays processingDays;
	private int salesOrganizationId;
	private String description;
	private int hourStart;
	private int hourEnd;
	private int intervalInMinutes;
	private boolean active;
	private Set<ServiceSchedule> serviceSchedules = new HashSet<ServiceSchedule>(0);

	public Schedule() {
	}

	public Schedule(int id, ProcessingDays processingDays,
			int salesOrganizationId, String description, int hourStart,
			int hourEnd, int intervalInMinutes, boolean active) {
		this.id = id;
		this.processingDays = processingDays;
		this.salesOrganizationId = salesOrganizationId;
		this.description = description;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
		this.intervalInMinutes = intervalInMinutes;
		this.active = active;
	}

	public Schedule(int id, ProcessingDays processingDays,
			int salesOrganizationId, String description, int hourStart,
			int hourEnd, int intervalInMinutes, boolean active,
			Set<ServiceSchedule> serviceSchedules) {
		this.id = id;
		this.processingDays = processingDays;
		this.salesOrganizationId = salesOrganizationId;
		this.description = description;
		this.hourStart = hourStart;
		this.hourEnd = hourEnd;
		this.intervalInMinutes = intervalInMinutes;
		this.active = active;
		this.serviceSchedules = serviceSchedules;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ProcessingDays getProcessingDays() {
		return this.processingDays;
	}

	public void setProcessingDays(ProcessingDays processingDays) {
		this.processingDays = processingDays;
	}

	public int getSalesOrganizationId() {
		return this.salesOrganizationId;
	}

	public void setSalesOrganizationId(int salesOrganizationId) {
		this.salesOrganizationId = salesOrganizationId;
	}

	public Serializable getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getHourStart() {
		return this.hourStart;
	}

	public void setHourStart(int hourStart) {
		this.hourStart = hourStart;
	}

	public int getHourEnd() {
		return this.hourEnd;
	}

	public void setHourEnd(int hourEnd) {
		this.hourEnd = hourEnd;
	}

	public int getIntervalInMinutes() {
		return this.intervalInMinutes;
	}

	public void setIntervalInMinutes(int intervalInMinutes) {
		this.intervalInMinutes = intervalInMinutes;
	}

	public boolean isActive() {
		return this.active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Set<ServiceSchedule> getServiceSchedules() {
		return this.serviceSchedules;
	}

	public void setServiceSchedules(Set<ServiceSchedule> serviceSchedules) {
		this.serviceSchedules = serviceSchedules;
	}

}
