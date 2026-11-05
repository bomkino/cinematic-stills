# Cinematic stills

How to get an image model to make a frame that looks stopped from a film, rather than posed for an advert. These are working notes from one real project, kept small on purpose.

## The idea

A film still is one frame stopped in the middle of a scene. People are in the middle of something with each other, and the frame doesn't explain it.

Generated images tend to do the opposite. Everyone is lit, everyone is sharp, everyone is performing, and the picture explains itself. Adding "cinematic" to the prompt makes that worse. What works is briefing the moment in plain words: who is mid-sentence, who is listening, where the one lamp is, and what stays out of frame.

## Real stills first

If a real still does the job, use it. Real frames are richer and more natural. Generate only to fill a gap, or when you need something very specific that no real still shows.

It helps to know what you're being measured against. Going through a board of 55 real stills, four things kept coming up:

- **Nobody is posing.** People are busy or mid-thought, and few of them are smiling.
- **The framing is imperfect.** Sometimes it's only hands, a figure through a doorway, or someone tiny against a coast.
- **Places have a history.** A desk buried in paper, or paint the weather has been at for years.
- **The light is simple.** One source falls away, and one strong colour sits in a quiet frame.

None of that is texture, which is why grain doesn't rescue a weak frame. It has to be in the prompt.

## What we found

We measured 44 real film and TV stills, then two tests and a full run against them. All figures are medians.

| | Brightness | Colour | Near black |
|---|---|---|---|
| 44 real stills | 27% | 0.11 | 30% |
| Test 1: briefed dark | 12% | 0.06 | 72% |
| Test 1 with blocking maps | 8% | 0.03 | 91% |
| Test 2: exposed for the faces | 24% | 0.16 | 40% |
| Full run on the lock, raw (one shot's six takes) | 14% | 0.085 | 71% |
| Final picks, finished | 22% | 0.088 | 44% |

- **Test 1** had the film texture, and the people were frozen. Adding faceless blocking maps made it darker still, so we dropped them.
- **Test 2** had real exchanges between people, with even light and a sharp, grinning crowd behind them. It looked like a warm advert.
- **The lock** below keeps what each test got right. Raw frames from the full run sat close to the real stills by eye.

The medians are not a target. One good reference still measured 10% brightness on its own, and test 2 hit 24% while still looking wrong. Average brightness can't see where the light falls. Use the numbers to catch drift, and let the eye decide.

## The lock

The rules every prompt in a run shares.

- **People in exchange.** Someone is mid-sentence and someone is listening. Eyes go from person to person, and expressions could go either way. Mouths are closed or just open. Smiles are small, just starting or just ending.
- **Light falls off.** One lamp lights the scene from one side, at the edge of the frame or just outside it. The people sit in that pool, with skin warm and easy to read. The walls and the far side of the room fall dim.
- **Only the exchange is sharp.** Everyone behind is soft, dim and out of focus.
- **The crowd stays quiet.** People behind are shapes: turned away, mid-drink, mouths closed.
- **Close.** Heads and shoulders, with the camera nearer than feels polite, at seated or shoulder height. The frame cuts through heads, elbows and furniture, the main people sit off centre, and the ceiling stays out of frame.
- **Ordinary people.** Faces you'd pass in a supermarket, of different ages and backgrounds in the same room, with a new cast in every take.
- **Plain clothes.** Dark jumpers, T-shirts, fleeces and work shirts, mostly solid.
- **One colour sings.** Each prompt names it. Everything else stays muted and still holds colour.
- **A near figure belongs to the scene.** Someone close to the lens takes part in the exchange, shows part of their face, and fills a quarter of the frame at most.
- **Ordinary mess.** A room people have lived in for years, with fewer things in it than you'd think, and props that aren't telling the joke.
- **Leave things out.** Part of the story stays outside the frame.

Shots of places keep the falling light, the mess and the leaving out, and hold detail in the shadows.

[PROMPTS.md](PROMPTS.md) turns the lock into prompts.

## Two tests, then commit

This is the rule against overcooking.

1. Test one shot. Look at it, and change the brief.
2. Test once more, if you need to.
3. Commit to the full run with what you've learnt.

In the full run, a take that misses gets one retry. A shot that still misses is covered by a real still or something else, with no reshoot. Our run was twelve shots of six takes: 72 takes and 14 retries gave thirteen picks and four spares.

Once the tests are done, let the run finish in one go:

- **Name the model.** Ask for the newest image model by name, fall back to the best one available, and record which one ran.
- **Hand over finished prompts.** A job file with each image's inputs, output path and final prompt leaves less to interpret than a brief.
- **Don't stop to ask.** Tell the agent to make the sensible call when something is unclear and write it down. Its own approval setting may still need changing.

## Regenerate, don't repair

A frame that misses gets a new generation, from its words and its original inputs. Don't ask a model to redo or adjust an image it made. In our drawn set, a redo came back with mottled noise across flat colour that a fresh generation didn't have.

Three habits keep this cheap:

- **Keep every prompt.** A saved prompt turns a change into a sentence, not a rebuild.
- **Swap one sentence and regenerate the set.** To change one thing across a series, such as a character's outfit, replace that sentence in each saved prompt and make every image again.
- **Attach originals only.** Inputs are the first supplied references, never a generated file.

Regenerated images won't match the old ones exactly, so keep the earlier versions and let a person choose between them.

## Finishing

The scripts need ImageMagick 7.

```bash
# The everyday finish: exposure, colour, grain
scripts/film.sh take.png final.jpg 1.25 100

# The rescue, for a take that shows too much: crop in, let the room fall away, then finish
scripts/focus.sh take.png tight.png 1100x619+380+110 620,290 430,270
scripts/film.sh tight.png final.jpg 0.95 85

# Check for drift
scripts/measure.sh final.jpg
```

Set `film.sh` by eye, frame by frame. Our picks used:

| Frame | Gamma | Saturation |
|---|---|---|
| Dark interiors | 1.08 to 1.30 | 95 to 100 |
| Fog | 0.86 | 100 |
| A frame gone postcard-bright | 0.76 | 62 |

Finishing has limits. Grain, halation and colour transfer barely moved a weak frame, while a closer crop and a relight moved it a lot. Grins and tidy sets can't be fixed afterwards, so they have to be right in the prompt.

One trap: grain goes on with Overlay here, because SoftLight doubled the brightness of a frame in ImageMagick 7.1, even on a mid-grey plate.

## Faces and honesty

- Every face is invented and described in words.
- Stills of real performers are never inputs, even for composition.
- Tell clients which images are generated, why you generated them, and that you usually prefer real ones.

This repo holds no film stills and no sample frames. The stills aren't ours to publish, and the frames from the project aren't either.

## Scope

One project, made with ChatGPT Images run by Codex in November 2026. The shots were people indoors, plus streets and weather. The rules should carry to other models, but we haven't tested them there.

Next to test: shots with no face to judge, such as hands, backs, doorways and far-off figures, and people busy alone rather than in an exchange. Real stills lean on both, and an invented face may be what gives a generated frame away. That's a hunch so far, so it isn't in the lock.

## For agents

[AGENTS.md](AGENTS.md) has the steps. Codex and Claude can both load it.

## Licence

MIT. See [LICENSE](LICENSE).
