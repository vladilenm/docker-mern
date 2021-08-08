export function List({list = []}) {
  if (list.length === 0) {
    return <p className="text-center">No notes yet.</p>
  }

  return (
    <ul className="list">
      {list.map(note => (
        <li key={note._id} className="list-item">{note.text}</li>
      ))}
    </ul>
  )
}