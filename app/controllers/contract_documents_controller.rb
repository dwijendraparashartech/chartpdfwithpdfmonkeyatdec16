class ContractDocumentsController < ApplicationController
  def show
    contract = Contract.find(params[:id])
    document = Pdfmonkey::Document.fetch(contract.pdfmonkey_id)

    redirect_to document.download_url
  end

  def index
    @contracts = Contract.all
    document = Pdfmonkey::Document.fetch(contract.pdfmonkey_id)

    redirect_to document.download_url
  end
end