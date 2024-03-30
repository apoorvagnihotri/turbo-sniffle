using Makie

# Generate some data
x = 1:10
y = rand(10)

# Create a new figure
fig = Figure()

# Create a line plot
lines!(fig, x, y)

# Show the plot
display(fig)