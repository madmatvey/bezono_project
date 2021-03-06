import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import Chat from '../components/Chat';
import * as ChatActions from '../actions/chat';

function mapStateToProps(state) {
  // console.log(state);
  return {
    explanations: state.explanations,
    current_user: state.current_user,
    demand: state.demand
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(ChatActions, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Chat);
