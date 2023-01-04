Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KnIYKLG4/HfOZWrHzp5NofNRVbKuqRtRcNMMTJc3Y0=;
        b=J6dT98aAs2C2CYpx+p8A4ueK6+y0fST0cxAnP8Licn4SYsxrn9yRcr7trTdqXmc8Vi
         7gD7M9lB2fnHllQxA2zecXOsb+3Ag6jnFYpFsFXF6ZcGxonfNMkSsG+UTe5M2Ub2HvrP
         9b/TKqZBIizuij/DHmvDCAnRn4qMoSBud9I9DPLtryBYuAvSrf5iLWzJAazeGbNnUt+5
         4tJEAREUAe69qKn+Jl0aM1BmVtMOj0GZOSmKDC0o9dMn969uZN7gq2eIsZwOh+h1J5rv
         Q/ETAxvBNjoQ0GStOsT77gXdm/rNm31evxt09aDt4qqKMpvSHdWimfuQ9dScH6pmTP85
         Itgw==
Message-ID: <a6918105-fa03-7e22-7f66-69d3e097888e@gmail.com>
Date: Wed, 4 Jan 2023 18:30:42 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/3] Rework epigraphs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I could have made a simple patch to add an \emph{} to the
\epigraph command at Section 11.1, but I ended up reworking
all the epigraphs instead.

Why?

Because I don't think putting an \emph{} in every \epigraph
command is the right thing to do. You might miss doing it while
adding a new one or replacing an existing one.

Hence the large diff of Patch 1/3.

Patches 2/3 and 3/3 are more of POCs of tweaking the look of
epigraphs. You can control it all together by redefining
\epigraph in the preamble.

I think emphasizing quoted text and using small-caps shape for
the source part can make epigraphs look distinct from main text.
Emphasizing book titles is consistent with the convention in
Bibliography.

That said, I'm not sure if you like the modified look of them.
If you have a better idea, please let me know.

        Thanks, Akira

--
Akira Yokosawa (3):
  Redefine \epigraph to avoid boilerplate \emph{}
  epigraph: Emphasize quoted text and book titles
  Use Biolinum font family for epigraph

 SMPdesign/SMPdesign.tex              |  6 +++---
 SMPdesign/beyond.tex                 |  4 ++--
 SMPdesign/criteria.tex               |  2 +-
 SMPdesign/partexercises.tex          |  2 +-
 ack.tex                              |  2 +-
 advsync/advsync.tex                  |  6 +++---
 advsync/rt.tex                       |  4 ++--
 appendix/questions/questions.tex     |  2 +-
 appendix/styleguide/styleguide.tex   |  2 +-
 appendix/toyrcu/toyrcu.tex           |  2 +-
 appendix/whymb/whymemorybarriers.tex |  2 +-
 count/count.tex                      | 12 ++++++------
 cpu/cpu.tex                          |  2 +-
 cpu/hwfreelunch.tex                  |  2 +-
 cpu/overheads.tex                    |  2 +-
 cpu/overview.tex                     |  2 +-
 cpu/swdesign.tex                     |  2 +-
 datastruct/datastruct.tex            | 16 ++++++++--------
 debugging/debugging.tex              | 18 +++++++++---------
 defer/defer.tex                      |  4 ++--
 defer/hazptr.tex                     |  2 +-
 defer/rcu.tex                        |  2 +-
 defer/seqlock.tex                    |  2 +-
 defer/updates.tex                    |  2 +-
 defer/whichtochoose.tex              |  2 +-
 easy/easy.tex                        | 10 +++++-----
 formal/axiomatic.tex                 |  2 +-
 formal/formal.tex                    |  6 +++---
 formal/ppcmem.tex                    |  2 +-
 formal/sat.tex                       |  2 +-
 formal/spinhint.tex                  |  2 +-
 formal/stateless.tex                 |  2 +-
 future/cpu.tex                       |  2 +-
 future/formalregress.tex             |  2 +-
 future/fp.tex                        |  2 +-
 future/future.tex                    |  2 +-
 future/htm.tex                       |  2 +-
 future/tm.tex                        |  2 +-
 glossary.tex                         |  4 ++--
 howto/howto.tex                      | 12 ++++++------
 intro/intro.tex                      | 12 ++++++------
 locking/locking-existence.tex        |  2 +-
 locking/locking.tex                  | 14 +++++++-------
 memorder/memorder.tex                | 14 +++++++-------
 owned/owned.tex                      | 14 +++++++-------
 perfbook-lt.tex                      |  5 ++++-
 qqz.sty                              |  2 +-
 summary.tex                          |  2 +-
 together/applyrcu.tex                |  2 +-
 together/count.tex                   |  2 +-
 together/hazptr.tex                  |  2 +-
 together/refcnt.tex                  |  2 +-
 together/seqlock.tex                 |  2 +-
 together/together.tex                |  2 +-
 toolsoftrade/toolsoftrade.tex        | 10 +++++-----
 55 files changed, 124 insertions(+), 121 deletions(-)


base-commit: 81ce330ad5a1a687ef43129373fb1f38bef9dd55
-- 
2.25.1

