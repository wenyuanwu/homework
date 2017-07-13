import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component(){

	constructor(){
		super();
		this.state = {searchTerm: 'golden retriever'};
		this.handleChange = this.handleChange.bind(this);
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	componentDidMount() {
		this.props.fetchSearchGiphys('golden+retriever');
	}

	handleChange(e) {
		this.setState({searchTerm: e.currentTarget.value});
	}

	handleeSubmit(e) {
		e.preventDefault();
		let searchTerm = this.state.searchTerm.split(' ').join('+');
		this.props.fetchSearchGiphys(searchTerm);
	}

	render(){
		let {giphys} = this.props;
		return (
		 <div>
		 	<form className="search-bar">
		 	<input value={this.state.searchTerm} onChange = {this.handleChange} />
		 	<button type="submit" onClick={this.handleSubmit} > Search Giphy</button>
		 	</form>
		 </div>
		);

	}

}
	

export default GiphysSearch;
