# Prompts

Every prompt has four parts, in this order:

**opening + base + take line + close**

| Part | What it does |
|---|---|
| Opening | Always `Photorealistic film still.` |
| Base | The scene: the place, the one lamp, what falls dim, the one colour. It stays the same across a shot's takes. |
| Take line | This take's moment, camera position and cast. |
| Close | Fixed, one for people and one for places. |

**Close for people:**

> Only these people are sharp; everyone behind is soft, dim and out of focus. The walls fall dim and the ceiling stays out of frame. Honest and unposed, real skin texture and worn fabric, soft film grain. No text.

**Close for places:**

> Detail holds in the shadows. Honest and unposed, real texture, soft film grain. No text.

## Rules of the words

- **Describe what the camera sees.** Plain words, as if telling someone what's in the frame.
- **Leave out praise and production words:** cinematic, stunning, masterpiece, 8K, hyper-detailed, studio, shoot, styling.
- **Six takes means six different prompts.** One prompt repeated gives you the same cast every time. Change the moment, the camera position and the cast in every take.
- **Go easy on texture words.** "Weathered surfaces" turned ordinary houses derelict.
- **Words only for photographs.** Every face is invented, so describe people by age, clothes and what they're doing.
- **One figure, one pose per generation** for drawn characters or anything else that needs a reference. Attach one reference at most, because a sheet as input invites a sheet as output. Build sheets afterwards from the finished files.
- **Keep an uncast lead undecided.** Show them from behind or as hands, with their hair covered, so the frame doesn't cast them.

## Worked example: people

**Base:**

> A laundrette near closing time. A hanging lamp over the folding table at the left edge of the frame lights the people at it, and the dryers and far wall fall dim. A worn bench, a basket of towels, a handwritten notice turned away from the camera. The one colour is a faded red towel.

**Six take lines:**

1. Two sisters in their fifties fold a sheet between them. The one on the left is mid-sentence with her eyes on the corners of the sheet. The other has stopped folding and is looking at her. Camera at shoulder height and close, the frame cutting through the sheet.
2. A man in his sixties in a work shirt sits on the bench beside his son, who is in his twenties. The son has just said something and is looking away at the dryers. The man hasn't decided how to answer. Camera low, at seated height, nearer than feels polite.
3. A nurse in a plain fleece leans on the folding table with half a smile just ending. An older woman across from her holds a pair of socks and hasn't answered yet. The older woman's shoulder and part of her cheek sit close to the lens.
4. Two friends in their thirties, one in a grey T-shirt and one in a dark jumper. One is counting coins into the other's palm, and neither of them is looking at the money. Camera at table height, the frame cutting through their elbows.
5. A woman in her forties sits on the folding table with her shoes off, talking to a man in a fleece who is pairing socks and only half listening. His eyes have just come up to meet hers. Camera at seated height, both of them off centre to the right.
6. A woman in her seventies in a buttoned cardigan hands a folded shirt to a delivery driver in a dark jacket. He is mid-word. Camera behind her shoulder, so she is a near figure filling a quarter of the frame.

**Take 1 assembled:**

> Photorealistic film still. A laundrette near closing time. A hanging lamp over the folding table at the left edge of the frame lights the people at it, and the dryers and far wall fall dim. A worn bench, a basket of towels, a handwritten notice turned away from the camera. The one colour is a faded red towel. Two sisters in their fifties fold a sheet between them. The one on the left is mid-sentence with her eyes on the corners of the sheet. The other has stopped folding and is looking at her. Camera at shoulder height and close, the frame cutting through the sheet. Only these people are sharp; everyone behind is soft, dim and out of focus. The walls fall dim and the ceiling stays out of frame. Honest and unposed, real skin texture and worn fabric, soft film grain. No text.

## Worked example: a place

**Base:**

> A market square at first light, before the stalls open. Low cloud, wet cobbles. One lamp is still on at the right edge of the frame, and the square falls grey beyond it. Bare stall frames, folded tarpaulins, a crate on its side. The one colour is a green tarpaulin.

**Take lines:** for a place, change the position and what's left out.

1. From the corner by a shuttered café, a stall frame cutting through the left of the shot.
2. Low from the kerb, wet cobbles filling the bottom third, the lamp just inside the frame.
3. Through the gap between two hanging tarpaulins, with most of the square left out.

Places can come back postcard-bright. Calm those with `film.sh`, as the README shows.
