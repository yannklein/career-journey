export const store = {
  debug: true,
  state: {
    selectedStep: "9"
  },
  setSelectedStepAction (newValue) {
    if (this.debug) console.log('setSelectedStepAction triggered with', newValue)
    this.state.selectedStep = newValue
  },
  clearSelectedStepAction () {
    if (this.debug) console.log('clearSelectedStepAction triggered')
    this.state.selectedStep = "9"
  }
}
