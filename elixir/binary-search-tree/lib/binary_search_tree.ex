defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, data), do: new(data)

  def insert(%{data: root_data} = root, data) when root_data >= data,
    do: %{root | left: insert(root.left, data)}

  def insert(root, data),
    do: %{root | right: insert(root.right, data)}

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(nil), do: []

  def in_order(tree) do
    traverse(tree, [])
  end

  defp traverse(nil, acc), do: acc

  defp traverse(tree, acc) do
    traverse(tree.left, [tree.data | traverse(tree.right, acc)])
  end
end
