# Making stopped frames

Use this for any job that generates photographic images meant to sit beside real film stills. The target is a **stopped frame**: one moment from the middle of a scene, between people who aren't performing for the camera.

The **lock** and the evidence are in [README.md](README.md). The prompt pattern and examples are in [PROMPTS.md](PROMPTS.md). Read both before step 2.

## Guardrails

These hold in every step.

- Every face is invented and described in words. Photographs are made from words alone.
- Inputs contain no stills of real performers, for any purpose, including composition.
- Images that reach a client are labelled as generated.
- A person makes the picks.
- A take that misses is regenerated from its prompt and original inputs. Generated images are never inputs, and nothing is edited in place.

## Steps

1. **Find the gap.** Look for a real still that does the job. Done when the brief names a gap no real still fills, or the person has told you to generate anyway.

2. **Write the shots.** Write a base and six take lines per shot, following PROMPTS.md. Done when every take differs from the others in moment, camera position and cast, and every prompt is free of the words PROMPTS.md leaves out.

3. **Test.** Generate one shot and show it to the person as a labelled sheet. Change the brief from what they say. Two tests is the limit, then commit. Done when the person says go, or the second test is reviewed.

4. **Run.** Ask for the newest image model by name and fall back to the best one available. One image per generation, at the largest size the tool gives. Work through the shots in order without stopping to ask, and when something is unclear, make the sensible call and note it. A take that misses gets one retry. Save every take and build one labelled sheet per shot. Done when every take exists or has used its retry, and a manifest lists each file, its prompt, its retries, the model that ran and any calls you made.

5. **Review.** Look at every take on its sheet and flag the ones with grins, posing, a sharp crowd, a visible ceiling, text, or a background figure who could read as a lead. Show the person the sheets with your flags. Done when the person has named the picks. A shot with no pick is covered by a real still or something else, with no reshoot.

6. **Finish.** Run `scripts/film.sh` on each pick, setting gamma and saturation by eye. For a pick that shows too much, run `scripts/focus.sh` first, with every face in the exchange inside the sharp zone. Done when you have viewed each finished frame at full size and every face is clear. `scripts/measure.sh` catches drift; your eye decides.

7. **Hand over.** Report what you can stand behind: each pick with its source take and settings, what you viewed at full size, and what you only saw on sheets. Done when the person has that list and every frame going to a client is labelled as generated.
