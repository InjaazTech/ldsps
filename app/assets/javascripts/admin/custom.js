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
		dragDropStr: 'اسحب وارفع',
		uploadStr: 'اختر صورة',
		doneStr: 'تم',
		extErrorStr: 'صيغة الملف غير مقبولة',
		sizeErrorStr: 'حجم الملف كبير',
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
		dragDropStr: 'اسحب وارفع',
		uploadStr: 'اختر صورة',
		doneStr: 'تم',
		extErrorStr: 'صيغة الملف غير مقبولة',
		sizeErrorStr: 'حجم الملف كبير',
		returnType: 'json'
    });
});