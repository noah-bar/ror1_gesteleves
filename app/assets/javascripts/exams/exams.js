const inputs = document.querySelectorAll('.note-input')
const studentsInputs = document.querySelectorAll('.student-id')
const examInput = document.querySelector('.exam-id')
const csrfToken = document.querySelector("[name='csrf-token']").content

console.log(csrfToken)

inputs.forEach((input, index) => {
  const studentInput = studentsInputs[index]
  let oldValue
  input.addEventListener('focus', (e) => {
    oldValue = e.target.value
    if(e.target.value === "N/A") {
      e.target.value = ""
    }
  })

  input.addEventListener('focusout', async (e) => {
    if(isNaN(e.target.value)) {
      e.target.value = oldValue
    } else {
      const note = e.target.value
      const examId = examInput.value
      const studentId = studentInput.value
      await updateNote(examId, studentId, note)
    }
  })
})

const updateNote = async (examId, studentId, note) => {
  const response = await fetch('/notes', {
    headers: {
      "X-CSRF-Token": csrfToken,
      "content-type" : "application/json",
      "accept" : "application/json"
    },
    credentials: "same-origin",
    method: "post",
    body: JSON.stringify({
      note: {
        exam_id: parseInt(examId),
        student_id: parseInt(studentId),
        value: parseFloat(note),
      }
    })
  })

  console.log(response)
}