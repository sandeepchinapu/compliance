class Compliance::FieldsData
  
  DATE_ARRAY = ['agency_form_detail', 'agency_tax_item_detail', 'agency_withholding_tax_details', 
      'agency_tax_payment_detail', 'tax_payment_frequency', 'electroinc_mandate_requirement', 
      'agency_tax_rate', 'agency_surcharge', 'pay_stub_requirement', 'agency_local_tax_rate_detail',
      'electronic_form_requirement', 'early_tax_payment_detail', 'employer_registration']
	
  def self.show?(json_data, flag)
    show_data = false
    json_data.each do |data|
      case flag
      when 'tax_payment_frequency_ot'
        show_data = (data[:tax_item_code] == 'WH/SDI' || data[:tax_item_code] == 'WC') 
        break if show_data
      when 'tax_payment_frequency_ui'
        show_data = (data[:tax_item_code] == 'UI' || data[:tax_item_code] == 'WH/UI')
        break if show_data
      when 'tax_payment_frequency_wh'
        show_data = (data[:tax_item_code] == 'WH/SDI' || data[:tax_item_code] == 'WH' || data[:tax_item_code] == 'WH/UI') 
        break if show_data
      end  
    end
    show_data
  end  

  def self.field_data
    {
      agency_form: {
        agency:
          [
            ['associated_form_id', 'Subform of', false],
            ['form_name', 'Form Name', false],
            ['description', 'Description', true],
            ['filing_frequency_note', 'Filing Frequency', false],
            ['filing_due_date_req_note', 'Filing Due Dates', false],
            ['non_workday_filing_note', 'Holiday and Weekend Rules', true],
            ['additional_instrictions_note', 'Additional Instructions', true],
            ['annual_reconciliation_yn_code', 'Annual Reconciliation', true],
            ['send_w2s_when_filing_yn_code', "W2's sent with Annual Filing?", false],
            ['file_zero_wage_yn_code', 'File Zero Wages Rule', false],
            ['file_zero_liability_yn_code', 'File Zero Liability Rules', false],
            ['filing_acknowledge_date_code', 'Filing Acknowledgement', true],
            ['filing_acknowledge_date_note', 'Filing Acknowledgement Note', true],
            ['payment_acknowledge_date_code', 'Payment Acknowledgement', true],
            ['payment_acknowledge_date_note', 'Payment Acknowledgement Note', true],
            ['form_detail_effective_date', 'Effective Date', true]
          ],
        history_agency: 
          [
            ['FormName','Form Name'], 
            ['Description', 'Description'], 
            ['AssociatedTaxFormID', 'Subform of'], 
            ['FilingFrequencyNote', 'Filing Frequency'], 
            ['FilingDueDateReqNote', 'Filing Due Dates'], 
            ['NonWorkdayFilingNote', 'Holiday and Weekend Rules'], 
            ['AdditionalInstructionsNote', 'Additional Instructions'], 
            ['AnnualReconYNCode', 'Annual Reconciliation'], 
            ['SendW2WhenFilingYNCode', "W2's sent with Annual Filing?"], 
            ['FilingZeroWageYNCode', 'File Zero Wages Rule'], 
            ['FilingZeroLiabilityYNCode', 'File Zero Liability Rules'], 
            ['FilingAckDateCode', 'Filing Acknowledgement'], 
            ['FilingAckDateNote', 'Filing Acknowledgement Note'], 
            ['PaymentAckDateCode', 'Payment Acknowledgement'], 
            ['PaymentAckDateNote', 'Payment Acknowledgement Note'], 
            ['DataEffectiveDate', 'Effective Date']
          ],
        send_methods:
          [
            ['quickbooks_form_yn_code', 'Send Methods Available in QuickBooks', true],
            ['payment_with_form_yn_code', 'Form is in QuickBooks', true],
            ['filing_method_note', 'Filing Methods-DIY', false],
            ['payment_method_note', 'Payment Methods-DIY', false],
            ['qb_methods_effective_date', 'QB Effective Date', false]
          ],
        history_send_methods:
          [
            ['QBFormYNCode', 'Form is in QuickBooks'], 
            ['PaymentWithFormYNCode', 'Payment can go with Form'], 
            ['FilingMethodNote', 'Filing Methods-DIY'], 
            ['PaymentMethodNote', 'Payment Methods-DIY'], 
            ['DataEffectiveDate', 'QB Effective Date'] 
          ]
      },
      agency_contact_info_fields: {
        agency_contact_info: 
          [
            ['agency_tax_item_name', 'Agency Name', false], 
            ['vendor_payable_name', 'Vendor Payable Name', false], 
            ['tax_item_code', 'Tax Item Code', true], 
            ['office_full_mailing_address', 'Mailing Address', false], 
            ['office_phone_number_detail', 'Phone Numbers', false], 
            ['customer_support_email_id', 'Support Email', false], 
            ['customer_support_url', 'Support Website URL', false], 
            ['agency_tax_item_website_url', 'Agency Website URL', false], 
            ['employer_guide_url', 'Employer Guide URL', true],
            ['last_verified_date','Agency Info Effective Date', false] 
          ],
        history_agency_contact_info:
          [
            ['agency_tax_item_name', 'Agency Name'],
            ['VendorPayableName', 'Vendor Payable Name'], 
            ['MailingAddress', 'Mailing Address'], 
            ['PhoneNumbers', 'Phone Numbers'], 
            ['CustomerSupportEmail', 'Customer Support Email'], 
            ['CustomerSuportURL', 'Support URL'], 
            ['AgencyWebsiteURL', 'Agency Website'], 
            ['AgencyWebsiteName', 'Agency Website Name'], 
            ['ReportCodeRequirements', 'Report Code Requirements'], 
            ['DataEffectiveDate', 'Effective Date'] 
          ],
        agency_holidays: 
          [
            ['legal_holidays_observed_note', 'Agency Holidays', false], 
            ['holiday_effective_date', 'Holiday Effective Date', false]
          ],
        history_agency_holidays:
          [
            ['HolidaysObservedNote', 'Agency Holidays'], 
            ['HolidayEffectiveDate', 'Holiday effective date']
          ],
        agency_acc_number_format:
          [
            ['account_number_name', 'Account Number Name', false], 
            ['quickbooks_er_acct_num_format', 'QuickBooks Employer Account Number Format(s)', false], 
            ['additional_er_acct_num_format', 'Additional Employer Account Number Detail', true], 
            ['account_number_effective_date', 'Account Number Effective Date ', false]
          ],
        history_agency_acc_number_format: 
          [
            ['AccountNumberName', 'Account Number Name'], 
            ['QBERAcctNumFormat', 'QuickBooks Employer Account Number Format(s)'], 
            ['PhoneNumbers', 'Phone Numbers'], 
            ['AddtnlERAcctNumFormat', 'Additional Employer Account Number Detail'], 
            ['DataEffectiveDate', 'Account Number Effective Date']
          ],
        report_code_info: 
          [
            ['reporting_codes_req_note', 'Reporting Code Requirements', false], 
            ['reporting_codes_req_doc', 'Reporting Code Doc', false]
          ]
      },
      agency_local_tax_fields: {
        agency_local_tax: 
          [
            ['tax_item_code', 'Form ID', false], 
            ['local_tax_name', 'Local Tax name', false], 
            ['local_tax_purpose_note', 'Local Tax Purpose Detail', false], 
            ['responsible_party_code', 'Responsible Party', false], 
            ['tax_rate_note', 'Tax Rate Detail', false], 
            ['additional_requirements_note', 'Additional Requirements', false], 
            ['tax_rate_effective_date', 'Rate Effective Date', false], 
            ['allowance_amounts_note', 'Allowance Amounts Detail', false], 
            ['tax_calculation_note', 'Tax Calculation Detail', false]
          ],
        history_agency_local_tax: 
          [
            ['LocalTaxName', 'Local Tax name'], 
            ['LocalTaxPurposeNote', 'Local Tax Purpose Detail'], 
            ['ResponsiblePartyCode', 'Responsible Party'], 
            ['TaxRateNote', 'Tax Rate Detail'], 
            ['TaxCalculationNote', 'Tax Calculation Detail'], 
            ['AllowanceAmtNote', 'Allowance Amounts Detail'], 
            ['AdditionalReqNote', 'Additional Requirements'], 
            ['DataEffectiveDate', 'Rate Effective Date'], 
            ['QBDIYReqNote', 'QuickBooks DIY Requirements'], 
            ['QBAssistedReqNote', 'Assisted Requirements'], 
            ['IOPReqNote', 'IOP Requirements']
          ],
        service_req: 
          [
            ['qb_diy_requirements_note', 'QuickBooks DIY Requirements', false], 
            ['qb_assisted_requirements_note', 'Assisted Requirements', false], 
            ['iop_requirements_note', 'IOP Requirements', false], 
            ['last_verified_date', 'Last Verified Date', false] 
          ]
      },
      agency_surcharge_fields: {
        agency_surcharge: 
          [
            ['surcharge_name', 'Surcharge Name', false], 
            ['surcharge_code', 'Surcharge Abbreviation', false], 
            ['creditable_to_futa_yn_code', 'Creditable to FUTA', false], 
            ['fixed_employer_rate', 'Fixed Rate', false], 
            ['minimum_employer_rate', 'Minimum Rate', false], 
            ['maximum_employer_rate', 'Maximum Rate', false], 
            ['employer_wage_base_amount', 'Wage Base Amount', false], 
            ['surcharge_effective_date', 'Surcharge Effective Date', false], 
            ['surcharge_expiration_date', 'Surcharge Expiration Date', false],
            ['last_verified_date', 'Last Verified Date', false]
          ],
        history_agency_surcharge: 
          [
            ['SurchargeName', 'Surcharge Name'], 
            ['SurchargeCode', 'Surcharge Abbreviation'], 
            ['CreditableFutaYNCode', 'Fixed Rate'], 
            ['FixedEmployerRate', 'Fixed Rate'], 
            ['MinEmployerRate', 'Minimum Rate'], 
            ['MaxEmployerRate', 'Maximum Rate'], 
            ['EmployerWageBaseAmt', 'Wage Base Amount'], 
            ['DataEffectiveDate', 'Effective Date'], 
            ['SurchargeExpirationDate', 'Surcharge Expiration Date']
          ],
        service_req: 
          [
            ['quickbooks_surcharge_yn_code', 'Supported QuickBooks Surcharge', false], 
            ['qb_diy_requirements_note', 'QuickBooks DIY Requirements', false], 
            ['qb_assisted_requirements_note', 'Assisted Requirements', false]
          ],
        history_service_req:
          [
            ['QBSurchargeYNCode', 'Supported QuickBooks Surcharge'], 
            ['QBDIYReqNote', 'QuickBooks DIY Requirements'], 
            ['QBAssistedReqNote', 'Assisted Requirements']
          ]
      },
      agency_tax_payment_fields: {  
        agency_tax_payment: 
          [
            ['agency_tax_payment_name', 'Tax Payment Name', false], 
            ['pay_zero_ach_credit_note', 'Pay Zero ACH Credit', true], 
            ['pay_zero_ach_debit_note', 'Pay Zero ACH Debit', true], 
            ['payment_coupon_note', 'Send paper Coupon/Return if Paying Electronically', true], 
            ['rounding_requirement_note', 'Rounding Requirement', true], 
            ['additional_requirements_note', 'Additional Requirements', true], 
            ['payment_detail_effective_date', 'Effective Date', true],
            ['last_verified_date', 'Last Verified Date', false]
          ],
        history_agency_tax_payment: 
          [
            ['TaxPaymentName', 'Tax Payment Name'], 
            ['PayZeroACHCreditNote', 'Pay Zero ACH Credit'], 
            ['PayZeroACHDebitNote', 'Pay Zero ACH Debit'], 
            ['PaymentCouponNote', 'Send paper Coupon/Return if Paying Electronically'], 
            ['RoundingReqNote', 'Rounding Requirement'], 
            ['AdditionalReqNote', 'Additional Requirements'], 
            ['DataEffectiveDate', 'Effective Date']  
          ]
      },
      agency_tax_rate_fields: {
        agency_tax_rate: 
          [
            ['fixed_employer_rate', 'Fixed Rate', true], 
            ['fixed_employer_amount', 'Fixed Dollar Amount', false], 
            ['minimum_employer_rate', 'Minimum Rate', false], 
            ['maximum_employer_rate', 'Maximum Rate', false], 
            ['new_employer_rate', 'New Rate', false], 
            ['new_construction_er_rate_note', 'New Construction Rate Details', true], 
            ['er_limit_freq_calculation_cd', 'Limit Calculation Frequency', true], 
            ['er_rate_effective_date', 'Rate Effective Date',false] 
          ],
        history_agency_tax_rate: 
          [
            ['FixedEmployerRate', 'Fixed Rate'], 
            ['FixedEmployerAmt', 'Fixed Dollar Amount'], 
            ['MinEmployerRate', 'Minimum Rate'], 
            ['MaxEmployerRate','Maximum Rate'], 
            ['NewConstructionERRateNote', 'New Construction Rate Details'], 
            ['ERLimitFreqCalcCD', 'Limit Calculation Frequency'], 
            ['NewEmployerRate', 'New Rate'], 
            ['DataEffectiveDate', 'Rate Effective Date']
          ],
        employer_wage_base: 
          [
            ['employer_wage_base_amount', 'Wage Base Amount', false], 
            ['er_wage_base_effective_date', 'Wage Base Effective Date', false] 
          ],
        history_employer_wage_base: 
          [
            ['EmployerWageBaseAmt', 'Wage Base Amount'], 
            ['DataEffectiveDate', 'Wage Base Effective Date']
          ],
        employee_rates: 
          [
            ['fixed_employee_rate', 'Fixed Rate', false], 
            ['fixed_employee_amount', 'Fixed Dollar Amount', true], 
            ['ee_limit_freq_calculation_cd', 'Limit Calculation Frequency', true], 
            ['ee_rate_effective_date', 'Rate Effective Date', false] 
          ],
        history_employee_rates:
          [
            ['FixedEmployeeRate', 'Fixed Rate'], 
            ['FixedEmployeeAmt', 'Fixed Dollar Amount'], 
            ['EELimitFreqCalcCD', 'Limit Calculation Frequency'], 
            ['DataEffectiveDate', 'Rate Effective Date']
          ],
        employee_wage_base: 
          [
            ['employee_wage_base_amount', 'Wage Base Amount', false], 
            ['ee_wage_base_effective_date', 'Wage Base Effective Date', false] 
          ],
        history_employee_wage_base: 
          [
            ['EmployeeWageBaseAmt', 'Wage Base Amount'], 
            ['DataEffectiveDate', 'Wage Base Effective Date']
          ],
        service_req: 
          [
            ['qb_diy_requirements_note', 'QuickBooks DIY Requirements', false], 
            ['qb_assisted_requirements_note', 'Assisted Requirements', false], 
            ['iop_requirements_note', 'IOP Requirements', false] 
          ]
      },
      agency_withholdings_fields: {  
        agency_withholdings: 
          [
            ['calculate_tax_yn_code', 'WH Supported?', false], 
            ['allowance_amounts_note', 'Allowance Amount Detail', false], 
            ['supplemental_rates_note', 'Supplemental Rate Detail', false], 
            ['federal_wh_dependancy_note', 'Based on Federal Detail', true], 
            ['round_nearest_dollar_yn_code', 'Calculation Rounded to the Nearest Dollar', true], 
            ['wh_detail_effective_date', 'Effective Date', false] 
          ],
        history_agency_withholdings:
          [
            ['CalculateTaxYNCode', 'WH Supported?'], 
            ['AllowanceAmountsNote', 'Allowance Amount Detail'], 
            ['SupplementalRatesNote', 'Supplemental Rate Detail'], 
            ['FedWHDependencyNote', 'Based on Federal Detail'], 
            ['RoundNearestDollarYNCode', 'Calculation Rounded to the Nearest Dollar'], 
            ['DataEffectiveDate', 'Effective Date']
          ],
        w4_requirement: 
          [
            ['w4_filing_statuses_note', 'Filing Status Detail', true], 
            ['w4_deductible_items_note', 'Deducation/Allowance Detail', true], 
            ['w4_rate_requirement_note', 'Rate Requirement Detail', true], 
            ['w4_additional_req_note', 'Additional Requirements', true],
            ['federal_w4_allowed_yn_code', 'Can Use Federal W4?', false], 
            ['w4_effective_date', 'Effective Date', false] 
          ],
        history_w4_requirement: 
          [
            ['W4FilingStatusesNote', 'Filing Status Detail'], 
            ['W4DeductibleItemsNote', 'Deducation/Allowance Detail'], 
            ['W4RateReqNote', 'Rate Requirement Detail'], 
            ['W4AdditionalReqNote', 'Additional Requirements'], 
            ['FedW4AllowedYNCode', 'Can Use Federal W4?'], 
            ['DataEffectiveDate', 'Effective Date']
          ],
        service_req: 
          [
            ['qb_diy_requirements_note', 'QuickBooks DIY Requirements', false], 
            ['qb_assisted_requirements_note', 'Assisted Requirements', false], 
            ['iop_requirements_note', 'IOP Requirements', false] 
          ]
      },
      early_tax_payment_fields: {   
        early_tax_payment: 
          [
            ['qb_feature_cancelled_date', 'Date Feature Cancelled in QuickBooks', false], 
            ['qb_diy_requirements_note', 'QuickBooks DIY Recommendation', false] 
          ],
        electronic_funds_transfer: 
          [
            ['eft_eligibility_note', '"Are Payments allowed more often within a standard frequency?"', false], 
            ['eft_process_note', 'Are any communications sent to the employer if they send early?', false], 
            ['eft_communication_note', 'Are any communications sent to the employer if they send early?', false], 
            ['eft_form_note', 'Should a form be sent or used if making early payments?', false], 
            ['eft_timing_note', 'Any timing considerations?', false], 
            ['eft_known_sys_impacts_note', 'What system impacts can be expected at the agency? ', false], 
            ['check_eligibility_note', '"Are Payments allowed more often within a standard frequency?"', false], 
            ['check_process_note', 'What happens if early payments are sent?', false], 
            ['check_communication_note', 'Are any communications sent to the employer if they send early?', false], 
            ['check_form_note','Should a form be sent or used if making early payments?', false], 
            ['check_timing_note', 'Any timing considerations?', false], 
            ['check_known_sys_impacts_note', 'What system impacts can be expected at the agency?', false], 
            ['early_pay_effective_date','Effective Date', false] 
          ],
        history_early_tax_payment: 
          [
            ['QBFeatureCancelDate', 'Date Feature Cancelled in QuickBooks'], 
            ['QBDIYReqNote', 'QuickBooks DIY Recommendation'], 
            ['EFTEligibilityNote', '"Are Payments allowed more often within a standard frequency?"'], 
            ['EFTProcessNote', 'What happens if early payments are sent?'], 
            ['EFTCommunicationNote', 'Are any communications sent to the employer if they send early?'], 
            ['EFTFormNote', 'Should a form be sent or used if making early payments?'], 
            ['EFTTimingNote', 'Any timing considerations?'], 
            ['EFTSysImpactsNote', 'What system impacts can be expected at the agency?'], 
            ['ChkEligibilityNote', '"Are Payments allowed more often within a standard frequency?"'], 
            ['ChkProcessNote', 'What happens if early payments are sent?'], 
            ['ChkCommunicationNote', 'Are any communications sent to the employer if they send early?'], 
            ['ChkFormNote', 'Should a form be sent or used if making early payments?'], 
            ['ChkTimingNote', 'Any timing considerations?'], 
            ['ChkSysImpactsNote', 'What system impacts can be expected at the agency?'], 
            ['DataEffectiveDate', 'Effective Date']
          ]  
      },
      electronic_form_req_fields: {
        electronic_form_req:
          [
            ['filing_enrollment_note', 'Filing Enrollment Instructions', false], 
            ['payment_enrollment_note', 'Payment Enrollment Instructions', false], 
            ['login_requirement_note', 'Login Requirements', false], 
            ['additional_login_detail_note', 'Additional Login Requirements', false],
            ['bank_acct_change_note', 'Change Bank Account Instruction', false], 
            ['penalty_interest_req_note', 'Penalty Interest Requirements', false], 
            ['penalty_interest_howto_note', 'Penalty Interest Requirements', false], 
            ['alternative_submission_note', 'Alternative Submission Process', false], 
            ['e_form_req_effective_date', 'Effective Date', true]
          ],
        history_electronic_form_req: 
          [
            ['FilingEnrollmentNote', 'Filing Enrollment Instructions'], 
            ['PaymentEnrollmentNote', 'Payment Enrollment Instructions'], 
            ['LoginReqNote', 'Login Requirements'], 
            ['AddtionalLoginDetailNote', 'Additional Login Requirements'], 
            ['BankAcctChangeNote', 'Change Bank Account Instruction'], 
            ['PenaltyInterestReqNote', 'Penalty & Interest Requirements'], 
            ['PenaltyInterestHowtoNote', 'Paying Penalty & Interest'], 
            ['AltSubmissionNote', 'Alternative Submission Process'], 
            ['DataEffectiveDate', 'Effective Date']
          ]
      },
      electronic_mandate_req_fields: {    
        electronic_mandate_req: 
          [
            ['employer_filing_req_note', 'Employer Filing Requirements', false], 
            ['employer_payment_req_note', 'Employer Payment Requirements', false], 
            ['svc_provider_filing_req_note', 'Service Provider Filing Requirements', true], 
            ['svc_provider_payment_req_note', 'Service Provider Payment Requirements', true], 
            ['mandate_effective_date', 'Effective Date', false]
          ],
        history_electronic_mandate_req: 
          [
            ['EmployerFilingReqNote', 'Employer Filing Requirements'], 
            ['EmployerPaymentReqNote', 'Employer Payment Requirements'], 
            ['SvcProviderFilingReqNote', 'Service Provider Filing Requirements'], 
            ['SvcProviderPaymentReqNote', 'Service Provider Payment Requirements'], 
            ['DataEffectiveDate', 'Effective Date']
          ]
      },
      employer_registration_fields: {  
        employer_registration: 
          [
            ['preferred_method_code', 'How does the agency prefer the employer to register?', false], 
            ['registration_process_url', 'Where can I find out more about the agency process for registration?', false], 
            ['fee_yn_code', 'Is there a registration fee?', false], 
            ['form_name', 'What is the name of the form to use for registration?', false], 
            ['form_url', 'What is the link to the form for registration?', false], 
            ['registration_rules_note', 'Are there any special registration rules?', true], 
            ['estimated_completion_duration', 'How long does it take to get the registration processed?', true], 
            ['general_registration_note', 'Additional information aobut the registration for this state.', false]
          ]
        },
      pay_stub_requirement_fields: {
        pay_stub_requirement: 
          [
            ['general_delivery_req_note', "When does the employee's paystub need to be provided? (Web)]", false], 
            ['electronic_delivery_req_note', 'What requirements are there if an employer wants to provide pay stubs electronically or online?', false], 
            ['paper_deliver_req_note', 'What are the requirements for providing a written or a hardcopy pay stub to the employee? (Web)', false], 
            ['pay_stub_effective_date', 'Effective Date', false]
          ],
        history_pay_stub_requirement:
          [
            ['GeneralDeliveryReqNote', "When does the employee's paystub need to be provided? (Web)'"], 
            ['ElectronicDeliveryReqNote', 'What requirements are there if an employer wants to provide pay stubs electronically or online?'], 
            ['PaperDeliveryReqNote', 'What are the requirements for providing a written or a hardcopy pay stub to the employee? (Web)'], 
            ['DataEffectiveDate', 'Effective Date']
          ]
      },
      tax_payment_frequency_fields: {
        tax_payment_frequency: 
          [
            ['agency_tax_payment_name', 'Tax Payment Name', false], 
            ['tax_payment_frequency_code', 'Frequency', false], 
            ['frequency_determination_code', 'Frequency Determination Method', true], 
            ['freq_det_lookback_req_note', 'Frequency Determination Lookback', true], 
            ['liability_grouping_req_note', 'Liability Accrual Period', false], 
            ['tax_payment_due_date_note', 'Due Date', false], 
            ['holiday_requirement_note', 'Holiday Allowance', true], 
            ['threshold_requirement_note', 'Threshold Requirement', false], 
            ['additional_requirement_note', 'Additional Requirements', true], 
            ['pay_frequency_effective_date', 'Effective Date', false ]
          ],
        history_tax_payment_frequency: 
          [
            ['TaxPaymentName', 'Tax Payment Name'], 
            ['TaxPaymentFreqCode', 'Frequency'], 
            ['FreqDeterminationCode', 'Frequency Determination Method'], 
            ['FreqDetLookbackReqNote', 'Frequency Determination Lookback'], 
            ['LiabilityGroupingReqNote', 'Liability Accrual Period'], 
            ['TaxPaymentDueDateNote', 'Due Date'], 
            ['HolidayReqNote', 'Holiday Allowance'], 
            ['ThresholdReqNote', 'Threshold Requirement'], 
            ['AdditionalReqNote', 'Additional Requirements'], 
            ['PayFrequencyExpirationDate', 'Frequency Effective Date'], 
            ['DataEffectiveDate', 'Effective Date']
          ]
      },
      verification_fields: {
        verification_tracking: 
          [
            ['last_verified_date', 'Last Verified Date', false]
          ]
      }
    }
  end
end