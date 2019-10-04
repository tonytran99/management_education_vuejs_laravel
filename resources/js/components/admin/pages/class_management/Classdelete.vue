<template>
	<!-- The Modal -->
	<div class="modal" id="delete_modal">
	    <div class="modal-dialog">
	        <div class="modal-content">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Are you sure ?</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>
	            <!-- Modal footer -->
	            <div class="modal-footer">
	            	<button type="button" class="btn btn-primary text-right" @click='delete_yes'>Yes</button>
	                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
	            </div>

	        </div>
	    </div>
	</div>
</template>

<script type="text/javascript">
	export default {
		data(){
			return {
				id: '',
			}
		},

		methods: {
			delete_yes(){
				axios.delete(`admin/delete_data_class/${this.id}`)
				.then((response) => {
					this.$parent.get_data_class_list()
					$('#delete_modal').modal('hide')
					$(".modal-fade").modal("hide");
     				$(".modal-backdrop").remove();
     				toastr.success('Delete Class Successfully !', 'Response', {timeOut: 200})
				})
				.catch((error)=> console.log(error));
			}
		}
	}
</script>
