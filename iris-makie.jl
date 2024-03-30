using RDatasets
using CairoMakie
using Statistics

CairoMakie.activate!()

# Load a dataset from RDatasets
df = dataset("datasets", "iris")

# Perform some exploratory data analysis
species = unique(df.Species)
num_species = length(species)

# Summary statistics
summary_stats = describe(df[:, Not(:Species)])

# Define colors for each species
species_colors = [colorant"red", colorant"green", colorant"blue"]

figure = Figure()
ax = Axis(figure[1, 1])
ax.title = "Scatter plot of Sepal Length vs Sepal Width"
ax.xlabel = "Sepal Length"
ax.ylabel = "Sepal Width"
# Scatter plot of sepal length vs sepal width colored by species
scatter_plot = scatter!(
    ax,
    df.SepalLength,
    df.SepalWidth,
    group = repeat(1:num_species, inner = size(df, 1) ÷ num_species),
    color = repeat(species_colors, inner = size(df, 1) ÷ num_species),
    markersize = 5,
    legend = species,
)

# # save plot
save("iris-makie-scatter.png", figure, px_per_unit = 2)


# Histogram of petal length
ax = Axis(figure[1, 2])
ax.title = "Histogram of Petal Length"
ax.xlabel = "Petal Length"
ax.ylabel = "Frequency"
histogram_petal_length = hist!(ax,
    df.PetalLength,
    bins = 20,
)

# save the figure
save("iris-makie-histogram.png", figure, px_per_unit = 2)

