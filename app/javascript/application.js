// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

import { FilePondRails, FilePond } from 'filepond-rails'

window.FilePond = FilePond
window.FilePondRails = FilePondRails

const input = document.querySelector('.filepond')
FilePondRails.create(input, {
  credits: {},
  storeAsFile: true,
  allowMultiple: true,
  allowReorder: true
})
