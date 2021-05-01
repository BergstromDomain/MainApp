


<p id="notice"><%= notice %></p>

<h1>Listing People</h1>

<table>
  <thead>
    <tr>
      <th>Name</th>
    </tr>
  </thead>

  <tbody>
    <% @people.each do |person| %>
      <tr>
        <td><%= link_to "#{person.first_name} #{person.last_name}", person_path(person) %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Person', new_person_path %>


