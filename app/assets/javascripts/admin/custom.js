$(document).ready(function () {
	$('.alert').delay(3000).fadeOut('slow');
	
	var elem = $("#fileuploader");
	var maxFileCount = elem.data('max-file-count');
	elem.uploadFile({
		url: "/admin/attachments.json",
		fileName: "upload",
		acceptFiles: "image/*",
		maxFileCount: maxFileCount,
		showPreview: true,
		previewWidth: '100px',
		onSuccess: function (files, data, xhr) {
			if (maxFileCount > 1) {
				elem.append('<input type="hidden" name="attachments_ids[]" value="' + data.attachment.id + '">');
			} else {
				$('#attachment_id').val(data.attachment.id);
				$('#attachment_url').val(data.attachment.upload.url);
			}
		},
		dragDropStr: 'Drag and drop',
		uploadStr: 'Select an image',
		doneStr: 'Done',
		extErrorStr: 'Exentions is not supported',
		sizeErrorStr: 'Too big file'
	});

	$('.remove-img').on('ajax:success', function(e, data, status, xhr){
		var elem = $(this);
		elem.parent().parent().remove();
	});

	var elem = $("#fileuploaderGallery");
	elem.uploadFile({
		url: "/admin/attachments.json",
		fileName: "upload",
		allowedTypes: 'jpg,jpeg,png',
		acceptFiles: "image/*",
		maxFileCount: 20,
		showPreview: true,
		previewWidth: '100px',
		maxFileSize: 2*1024*1024,
		formData: {type: 'PostImageFile'},
		onSuccess: function (files, data, xhr) {
      $('form.post').append('<input type="hidden" name="attachments_ids[]" value="'+data.attachment.id+'" />');
		},
		dragDropStr: 'Drag and drop',
		uploadStr: 'Select an image',
		doneStr: 'Done',
		extErrorStr: 'Exentions is not supported',
		sizeErrorStr: 'Too big file',
		returnType: 'json'
		});
		
		var elem = $("#libfileuploader");
		elem.uploadFile({
			url: "/admin/attachments.json",
			fileName: "upload",
			acceptFiles: "*",
			maxFileCount: 1,
			showPreview: true,
			previewWidth: '100px',
			maxFileSize: 50*1024*1024,
			formData: {is_general: true},
			onSuccess: function (files, data, xhr) {
				window.location = '/admin/attachments';
			},
			dragDropStr: 'Drag and drop',
			uploadStr: 'Select a file',
			doneStr: 'Done',
			extErrorStr: 'Exentions is not supported',
			sizeErrorStr: 'Too big file'
		});
});