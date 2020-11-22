Return-Path: <SRS0=OS21=E4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=jnV/LFZHP2yobIUtyUleLdVe8qnTQdZeVsUgJRYMv/k=;
        b=JQY8cYA4hnTabL2GbcwTesVCmRaWsJkbgV6dFLrzZhqf7q25Hd7D3ydKM20zN7gQmL
         kr9P300mb+jaZiWX+iZSN8yii3pHhHWOYCO7Nz1y0qoC1WyA+pwdkhysJSfX3JM1ZL1R
         eykAPIQWSwtnat0qJ/dNfy6Eo12er/qKtaaURUM9WWcX9TExNcTECZgCTEI3UW3R5I7X
         uO19rXBHCUOwK8mpeQx8GF6xMSk+TyEozy5GvKSNPeJmqErEVIVe/st8XuA8lFCi6VO9
         BhUkPUML/DIsFI2z5K+UIQ7U8aoWho8qaB7aMoqA39BoWKJ8T+pzxHsNX+EqUBpZvrY6
         1xMw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [NOT PULL YET -perfbook] PoC of adding index to perfbook
Message-ID: <29dc3825-3aa7-2e69-ddde-5de61f7015dc@gmail.com>
Date: Mon, 23 Nov 2020 00:14:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So this *not-pull* request is to show you my WIP branch to add indices
to perfbook.

Patch 1/7 kicks of the changes by adding index annotations in Glossary.

Patch 2/7 reorganizes back matter of perfbook. Glossary, Bibliography,
Credits, and the newly added Index belong there.
I employed "tocbibind" package to include Bibliography in TOC.

Patch 3/7 adds API Index. Annotations for the Index is mostly done in
toolsoftrade.
You can see that raw \index or \sindex macros are avoided in .tex source
files.  Using custom macros for annotation can reduce diffs in adding
annotations.
glossary.tex is an exception, as every description item has
\index{} on it.  If we add other annotations there, we need to use
custom macros.

Patch 4/7 adds annotations for people's names. They could be in another
independent index, but they are merged into the general index.
As a result, the ratio of people's names in the index is quite high at the
moment.
It will decrease as we add annotations for general terms/words.
Names are presented in the index in the form of "surname, forename" order.
To enable this, annotation is done by \ppl{forename}{surname}.
When you need only surname in the text, use \pplsur macro instead.
For names with abbreviated middle name, there is a \pplmdl command as
well.

Patch 5/7 highlights indexed words/terms/names in the text.
This should help us in finding out what needs to be annotated.
If the color of DarkGreen is problematic for you, please let me know
which color is easy for you.
One of the purpose of avoiding raw \index{} macros for annotation is
to realize this coloring.

Patch 6/7 adds a few more annotations of people's names in "formal".

Patch 7/7 changes the layout of index from default 2 columns to 3 columns.
As mentioned in the change log, API Index shows a minor glitches of
extraneous line folding caused by the side effect of \co{} macro.
This issue has been fixed in the most recent LaTeX released on 2020-10-01.
I have not figured out if there is some workaround for older LaTeX.

The appearance of index pages does not matter so much at the moment,
I suppose.  We need to add annotations first.

To do that, we need to agree the organization of index pages.
Current indices are flat.
LaTeX indexing framework supports up to 3 levels of hierarchy.

For example:

Flat index

    Critical section, <page>
    ...
    Read-side critical section, <page>
    ...
    Write-side critical section, <page>

2 level index

    Critical section, <page>
        read-side, <page>
        write-size, <page>
    ...
    Read-side critical section, see Critical section, read-side
    ...
    Write-side critical section, see Critical section, write-side

Which do you prefer?

Another point on people's names.
I'm *not* thinking of making index of authors of Bibliography.
Due to the amount of cited material, it will require a ton of cleanups
in .bib files if you want the author index to look consistent.

Which means, you need to mention names of authors who you want to see
in the index.  Does this sound reasonable to you?

I know you are debugging/analyzing/testing RCU and lockdep interaction
right now.

I'm not in a hurry and looking forward to your feedback.

        Thanks, Akira

--
The following changes since commit 810da77e1c66ad543e34a10b197aa9e629c7dc8f:

  CodeSamples/formal: Use '{}' for empty init blocks in litmus tests (2020-11-15 12:38:36 -0800)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-not-pull-2020.11.23a

for you to fetch changes up to 9cecce4c32c9ff97f3330591d0699c8aa7e2585b:

  index: Trial of 3 column (2020-11-22 23:16:58 +0900)

----------------------------------------------------------------
Akira Yokosawa (7):
      PoC of indexing
      Reorganize backmatters
      PoC of additional API Index
      index: Add annotations to people's names for PoC
      Color indexed text conditionally
      index: Add some more people index annotations in 'formal'
      index: Trial of 3 column

 .gitignore                      |   3 +
 Makefile                        |  10 +-
 SMPdesign/SMPdesign.tex         |   2 +-
 SMPdesign/partexercises.tex     |   5 +-
 appendix/ack/ack.tex => ack.tex |   6 +-
 appendix/appendix.tex           |  20 --
 count/count.tex                 |   2 +-
 cpu/cpu.tex                     |   3 +-
 cpu/hwfreelunch.tex             |   6 +-
 cpu/overview.tex                |   4 +-
 datastruct/datastruct.tex       |   4 +-
 debugging/debugging.tex         |   5 +-
 defer/rcurelated.tex            |  92 +++++----
 defer/rcuusage.tex              |   3 +-
 formal/axiomatic.tex            |   4 +-
 formal/ppcmem.tex               |   7 +-
 formal/spinhint.tex             |   2 +-
 future/cpu.tex                  |  12 +-
 future/tm.tex                   |   2 +-
 glossary.tex                    | 112 +++++------
 howto/howto.tex                 |  37 ++--
 intro/intro.tex                 |   8 +-
 memorder/memorder.tex           |   6 +-
 perfbook-lt.tex                 |  75 ++++++-
 toolsoftrade/toolsoftrade.tex   | 420 ++++++++++++++++++++--------------------
 utilities/runlatex.sh           |   2 +
 26 files changed, 470 insertions(+), 382 deletions(-)
 rename appendix/ack/ack.tex => ack.tex (98%)
