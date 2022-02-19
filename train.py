"""
Train the model in PyTorch and get the accuracy.
Aiming for >= 92% accuracy?
"""

import torch
from tqdm import trange
from torch.utils.data import Dataset
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets
from torchvision import transforms as transforms
import matplotlib.pyplot as plt
import torch.nn.functional as F


transformations = transforms.Compose([transforms.CenterCrop(224),
                                      transforms.ToTensor()])

data_dir = "data"

train_data = datasets.ImageFolder(data_dir + '/train',
                                  transform=transformations)
test_data = datasets.ImageFolder(data_dir + '/test',
                                 transform=transformations)

trainloader = torch.utils.data.DataLoader(
    train_data, batch_size=32, shuffle=True)
testloader = torch.utils.data.DataLoader(
    test_data, batch_size=32, shuffle=True)


model = nn.Sequential(
    nn.Conv2d(3, 16, kernel_size=3, padding=1),
    nn.ReLU(),
    nn.MaxPool2d(2, 2),
    nn.Conv2d(16, 16, kernel_size=3, stride=1, padding=1),
    nn.ReLU(),
    nn.MaxPool2d(2, 2),
    nn.Flatten(),
    nn.Linear(50176, 512),
    nn.ReLU(),
    nn.Linear(512, 128),
    nn.ReLU(),
    nn.Linear(128, 10)
)

crit = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters())

num_epochs = 20
for epoch in trange(num_epochs):
    for i, data in enumerate(trainloader):
        inputs, labels = data
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = crit(outputs, labels)
        loss.backward()
        optimizer.step()

    # evaluate
    x_test, y_test = iter(testloader).next()
    _, y_pred = torch.max(model(x_test), 1)
    num_correct = 0
    total = 0
    print(labels)
    print(y_pred)
    for label, prediction in zip(labels, y_pred):
        if (abs(label - prediction) < 0.01):
            num_correct += 1
        total += 1

    print(f"num correct: {num_correct} and total: {total}")


num_correct = 0
total = 0
with torch.no_grad():
    for data in testloader:
        images, labels = data
        outputs = model(images)
        _, predictions = torch.max(outputs, 1)
        for label, prediction in zip(labels, predictions):
            if (label == prediction):
                num_correct += 1
            total += 1

print(num_correct / total)
