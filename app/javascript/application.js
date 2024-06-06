// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "filepond-plugin-image-preview"
import "filepond-plugin-file-validate-type"

import { FilePondRails, FilePond } from 'filepond-rails'

// Import the plugin code
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';// Register the plugin
// Import the plugin code
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';

// Register the plugin for Turbo
document.addEventListener('turbo:load', loadFilePond)

function loadFilePond() {
  FilePond.registerPlugin(
    FilePondPluginImagePreview,
    FilePondPluginFileValidateType
  );

  window.FilePond = FilePond
  window.FilePondRails = FilePondRails

  const input = document.querySelector('.filepond')
  FilePondRails.create(input, {
    credits: {},
    storeAsFile: true,
    allowMultiple: true,
    allowReorder: true,
    acceptedFileTypes: ['image/*'],
  })
}
