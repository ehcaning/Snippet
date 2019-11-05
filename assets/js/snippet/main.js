var mainData = [];

$("input#main-search").focus(function () {
	$(this).parent().addClass("focused");
}).blur(function () {
	$(this).parent().removeClass("focused");
});

function copyToClipboard(element) {
	var $temp = $("<textarea>");
	var brRegex = /<br\s*[\/]?>/gi;
	$("body").append($temp);
	var id = $(element).parent().parent().parent().data('id');
	$temp.val(mainData[id]).select();
	document.execCommand("copy");
	$temp.remove();

	alertify.set('notifier', 'position', 'top-center');
	alertify.success('🍩 Done 🎈');
}

function showCode(element) {

	$(element).parent().prev().find("p").toggle();
	$(element).parent().next().last().find("pre").toggle();
	$(element).text(function (i, text) {
		return text === "Show" ? "Hide" : "Show";
	})
}

var selectedFilter = 'All';
$('.absolute-top .btn-group button').click(function (e) {
	e.preventDefault();
	$(this).parent().find("button").removeClass();
	$(this).parent().find("button").addClass("btn btn-light");

	$(this).removeClass();
	$(this).addClass("btn btn-success");

	selectedFilter = $(this).html();
	sendAjax();

});

function sendAjax() {
	$.ajax({
		type: "POST",
		url: "/api/getSnippetData",
		data: {
			"searchFor": $('input#main-search').val(),
			"selectedFilter": selectedFilter
		},
		success: function (response) {
			$('div.results-div').empty();
			if (response != [])
				render(response);
		}
	});
}

$('input#main-search').keyup(function () {
	sendAjax();
});
sendAjax();

function render(data) {
	var q = '';
	$.each(data, function (index, value) {
		var tagsAll = '';
		$.each(value.tags, function (index, tag) {
			tagsAll += `<span class="badge badge-primary">${tag}</span>`;
		});
		var paragraph = '';
		if (value.description != '')
			paragraph = '<br><p>' + value.description + "</p>";
		q = `
	<div class="card results" data-id="${value.id}">
		<div class="card-body row">
			<div class="col-6">
				<h1 class="card-title mb-0">${value.title}</h1>
				${tagsAll}
				${paragraph}
			</div>
			<div class="col-6 ta-r">
				<button class="btn btn-dark btn-sm" onclick="showCode(this)">Show</button>
				<button class="btn btn-danger btn-sm" onclick="copyToClipboard(this)">Copy</button>
			</div>
			<div class="col-12">
				<pre><code class="${value.lang}">${value.data}</code></pre>
			</div>
		</div>
	</div>
		`;
		mainData[value.id] = value.dataRaw;
		$('div.results-div').append(q);
	});
	$('pre code').each(function (i, block) {
		hljs.highlightBlock(block);
	});
}

