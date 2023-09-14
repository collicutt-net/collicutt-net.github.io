---
layout: post
title:  "ChatGPT 4 Refusing to Write Code"
date:   2022-9-12
categories:
- genai
- coding
summary: Why has ChatGPT been nerfed for writing code?
header_image: "nerf.jpg"
---

It's pretty clear to me over the last few days, maybe a week or two, that ChatGPT 4 has been extensively nerfed for writing code.

>nerf: To water down, dumb down or especially weaken, particularly in video games.

Here's a simple application that is a go binary I was thinking of writing to setup a new python project. (I know, I know...using go code to setup a python project, but I wanted a binary that had all the files in it already, for some reason I've always liked that idea.)

Prompt:

- create a go based cli tool called adder that can be used to create a new python project
- files in templates directory copied directly into the binary

Not much there, but it's enough to get started.

The code generated by ChatGPT 4 a couple weeks ago for the command:

```
// File location: cmd/root.go

package cmd

import (
	"embed"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/spf13/cobra"
)

// Initialize with embed.FS from main.go
var templatesFS embed.FS

var rootCmd = &cobra.Command{
	Use:   "adder",
	Short: "A CLI to setup a Python app directory",
	Long: `Adder is a CLI that sets up a directory for a Python application,
	       placing hidden dot files and creating a virtual environment.`,
	RunE: func(cmd *cobra.Command, args []string) error {
		// Create directory if not exists
		// Placeholder for your logic here

		// Copy embedded templates to the new directory
		err := fs.WalkDir(templatesFS, "templates", func(path string, d fs.DirEntry, err error) error {
			if err != nil {
				return err
			}
			if d.IsDir() {
				return nil
			}
			content, err := templatesFS.ReadFile(path)
			if err != nil {
				return err
			}
			// Create a hidden file for each template
			err = os.WriteFile("."+filepath.Base(path), content, 0644)
			if err != nil {
				return err
			}
			return nil
		})
		if err != nil {
			return err
		}

		// Create a Python virtual environment if .venv doesn't exist
		if _, err := os.Stat(".venv"); os.IsNotExist(err) {
			cmd := exec.Command("python", "-m", "venv", ".venv")
			err := cmd.Run()
			if err != nil {
				return err
			}
		}
		return nil
	},
}

// Execute is the entry point for the CLI
func Execute(fsys embed.FS) {
	templatesFS = fsys
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
	}
}
```

The code generated by ChatGPT 4 today:

```
// cmd/root.go
package cmd

import (
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{Use: "adder"}

// Execute adds all child commands to the root command sets flags appropriately.
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(initConfig)
}

func initConfig() {
	// Configuration loading can go here, if needed.
}
```

In a bit more testing, basically ChatGPT 4 is refusing to implement functions inside the super basic skeleton it provides. It refuses to print out entire files, just putting "return nil" or "pass" in most functions even if you tell it not to.

I don't know what is going on behind the scenes, but it seems like a real setback here, making it pretty much unusable for writing code. One obvious problem with all these generative AI systems is that the backend can change at any time, as though Darth Vader is sipping coffee in the backend saying:

> Darth Vader: "I am altering the deal. Pray I don't alter it any further."

## Nerfing Reports

It's not just me. This was from a couple months ago, though this is not directly related to writing code:

> Most notably, GPT-4's ability to identify prime numbers reportedly plunged dramatically from an accuracy of 97.6 percent in March to just 2.4 percent in June. Strangely, GPT-3.5 showed improved performance in the same period.

* [Study claims ChatGPT is losing capability, but some experts aren’t convinced](https://arstechnica.com/information-technology/2023/07/is-chatgpt-getting-worse-over-time-study-claims-yes-but-others-arent-sure/)

## Am I Using It Wrong?

There has been a lot of activity with regards to GenAI, so many open source projects, commercial projects. It's not possible to keep up with all of them, or even the advances within OpenAI, e.g. "Code Interpreter." All I can say for sure is that that way I have been using ChatGPT 4 has remained the same, and the code quality and length has gone down considerably, in my opinion.

## Conclusion

I wonder why OpenAI has nerfed ChatGPT so badly. I can't imagine it would remain like this forever, as it's clear to me that GenAI is extremely useful in writing code. Are they preparing another product? Are they being threatened legally by some organization...Github/Microsoft maybe for the training data?

Reasons for nerfing:

- Preparing for legal challenges
- Preparing another product
- They don't want to be responsible for the code it writes
- Security concerns
- Getting ready for extensive  (but why regulation on writing code?)

I was expecting GenAI to get better at coding, but here we are, only a few months in, and it's considerably worse, basically unusable. Maybe it could be helpful with particular, singular functions, but it's not going to write a couple hundred line file for you.

If OpenAI keeps ChatGPT like this, they'll just get outpaced, by a massive margin no less, but other organizations. GenAI can help with coding, that is undeniable, but right now it would appear that OpenAI is not interested in that, or is working on something else behind the scenes.