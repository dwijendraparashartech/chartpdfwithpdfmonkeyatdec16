class Order < ApplicationRecord
	after_commit :generate_pdf

  private

  def generate_pdf
    # Don’t run this callback if the pdfmonkey_id is updated
    return if previous_changes.key?('pdfmonkey_id')

    # Retreive the data you want to send to generate your document
    dynamic_data = attributes.slice('price', 'status')

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
