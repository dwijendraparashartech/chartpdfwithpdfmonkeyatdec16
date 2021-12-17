class Contract < ApplicationRecord
  DOCUMENT_TEMPLATE_ID='E939699A-11D0-4B00-8F61-BA5F55F670A0'
  after_commit :generate_pdf


  private
  def generate_pdf
    # Don’t run this callback if the pdfmonkey_id is updated
    return if previous_changes.key?('pdfmonkey_id')
    # Retreive the data you want to send to generate your document
    dynamic_data = attributes.slice('client_name', 'client_address', 'service_fee')
    # Generate the document and wait for it to be generated
    pdfmonkey_doc = Pdfmonkey::Document.generate!(DOCUMENT_TEMPLATE_ID, dynamic_data)
    if pdfmonkey_doc.status == 'success'
      # Update the PDFMonkey document id stored in the contract
      update(pdfmonkey_id: pdfmonkey_doc.id)
    else
      # Handle cases where the document failed for some reason
    end
  end
end