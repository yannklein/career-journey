export const store = {
  debug: true,
  state: {
    selectedStep: ""
  },
  setSelectedStepAction (newValue) {
    if (this.debug) console.log('setSelectedStepAction triggered with', newValue);
    this.state.selectedStep = newValue;
  }
}
