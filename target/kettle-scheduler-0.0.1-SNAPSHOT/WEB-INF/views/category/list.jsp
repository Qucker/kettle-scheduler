<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>任务分类列表</title>
    <link href="static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="static/css/animate.css" rel="stylesheet">
    <link href="static/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>任务分类列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
            	<div class="col-sm-6 float-left">
	            	<a href="view/category/addUI.shtml" class="btn btn-w-m btn-info" type="button">
	            		<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;新增任务分类
            		</a>
            	</div>
                <table id="categoryList" data-toggle="table"
					data-url="category/getList.shtml"
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="categoryId" data-formatter="IdFormatter">任务分类编号</th>
							<th data-field="categoryName">任务分类名称</th>
							<th data-field="addTime">创建时间</th>
							<th data-field="editTime">更新时间</th>
							<th data-field="action" data-formatter="actionFormatter"
								data-events="actionEvents">操作</th>
						</tr>
					</thead>
				</table>
            </div>
        </div>
	</div>
	<!-- 全局js -->
    <script src="static/js/jquery.min.js?v=2.1.4"></script>
    <script src="static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- layer javascript -->
    <script src="static/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="static/js/content.js?v=1.0.0"></script>
    <!-- Bootstrap table -->
    <script src="static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script>

        function IdFormatter(value, row, index) {
            // var pageSize=$('#table').bootstrapTable('getOptions').pageSize;
            // //获取当前是第几页
            // var pageNumber=$('#table').bootstrapTable('getOptions').pageNumber;
            // return pageSize * (pageNumber - 1) + index + 1;
            return index+1;
        };

	    function actionFormatter(value, row, index) {
	    	return ['<a class="btn btn-primary btn-xs" id="edit" type="button"><i class="fa fa-edit" aria-hidden="true"></i>&nbsp;编辑</a>',
    			'&nbsp;&nbsp;',
    			'<a class="btn btn-primary btn-xs" id="delete" type="button"><i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除</a>'].join('');
	    };
	    window.actionEvents = {
	    		'click #edit' : function(e, value, row, index) {
	    			var categoryId = row.categoryId;
	    			location.href = "view/category/editUI.shtml?categoryId=" + categoryId;
	    		},
	    		'click #delete' : function(e, value, row, index) {
	    			layer.confirm('确定删除该单位？', {
	    				  btn: ['确定', '取消']
	    				},
	    				function(index){
	    				    layer.close(index);
	    				    $.ajax({
	    				        type: 'POST',
	    				        async: true,
	    				        url: 'category/delete.shtml',
	    				        data: {
	    				            "categoryId": row.categoryId
	    				        },
	    				        success: function (data) {
	    				        	location.replace(location.href);
	    				        },
	    				        error: function () {
	    				            alert("系统出现问题，请联系管理员");
	    				        },
	    				        dataType: 'json'
	    				    });
	    		  		},
	    		  		function(){
	    		  			layer.msg('取消操作');
    		  			}
    		  		);
	    		},
	    	};

		    function queryParams(params) {
		    	var temp = { limit: 10, offset: params.offset };
		        return temp;
		    };

		    function getIdSelections() {
		    	var $categoryList = $('#categoryList');
		        return $.map($categoryList.bootstrapTable('getSelections'), function (row) {
		            return row.repositoryId
		        });
		    }


    </script>
</body>
</html>
