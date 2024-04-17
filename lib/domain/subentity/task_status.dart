enum TaskStatus { planned, executing, done }

TaskStatus convertStatus(String name) {
  switch (name) {
    case "planned":
      return TaskStatus.planned;
    case "executing":
      return TaskStatus.executing;
    case "done":
      return TaskStatus.done;
    default:
      return TaskStatus.planned;
  }
}
