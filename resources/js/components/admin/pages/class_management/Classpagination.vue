<template>
	<ul v-if="pagination.last_page > 1" class="pagination">
	    <li class="page-item" @click="prevpage"><a class="page-link" href="javascript:void(0)">Previous</a></li>
	    <li v-for="page in pagination.last_page" v-bind:class="[(page == pagination.current_page) ? 'page-item active' : 'page-item']"><a class="page-link" href="javascript:void(0)" @click="gotopage(page)">{{ page }}</a></li>
	    <li class="page-item" @click="nextpage"><a class="page-link" href="javascript:void(0)">Next</a></li>
	</ul>
</template>

<script type="text/javascript">
	export default {
		data(){
			return {
				pagination: {}
			}
		},

		methods: {
			gotopage(page){
				this.$parent.pagination.current_page = page
				this.$parent.get_data_class_list()
			},
			prevpage(){
				if(this.pagination.current_page != 1)
				{
					this.$parent.pagination.current_page--;
					this.$parent.get_data_class_list()
				}
			},
			nextpage(){
				if(this.pagination.current_page != this.pagination.last_page)
				{
					this.$parent.pagination.current_page++;
					this.$parent.get_data_class_list()
				}
			}
		}
	}
</script>