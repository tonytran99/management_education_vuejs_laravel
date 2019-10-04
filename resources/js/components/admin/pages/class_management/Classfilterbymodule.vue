<template>
	<select class="form-control" @change="filterModule($event)">
    	<option selected value="">Choose Module</option>
    	<option v-for="module in all_module" v-bind:value="module.id">{{module.name}} - {{module.module_code}}</option>
    </select>
</template>

<script type="text/javascript">
	export default {
		data(){
			return {
				all_module: {},
			}
		},
		methods: {
			filterModule(event)
			{
				if(event.target.value != '')
				{
					var module_id = event.target.value
					axios.get(`admin/get_data_class_by_module/${module_id}`)
					.then((response) => {
						this.$parent.data_class_list = response.data
						this.$parent.pagination.current_page = 1
						this.$parent.pagination.last_page = 1
						this.$parent.$children[1].pagination = this.$parent.pagination
					})
					.catch((error) => {
						console.log(error)
					})
				}
				else
				{
					this.$parent.get_data_class_list()
				}
			}
		}
	}
</script>