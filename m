Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=uh5xvNlPXJzu0WnBFhTCVmCPZ9r0H6oiZjHNb0Q7tLY=;
        b=ucDZ83rtf0gtlCo7S9PuM7yIMuWGI4Iqayw/pYTXSkOhAA0cpcJNLOIlcZePGLIqlx
         0Lfi/QxOxtk1W/3URuWH1stFjW4Z1Ab07G9VrOebwJvbOeJna5HEHY3VGl2gv7mz2Rxn
         Mq3P+VkU3vq3WtYYO/yBAdtf0Bu1otspbq3yZyiAORVJAG2bDqCGLyXoEI9t35wp9s2M
         6psOqljhzu80+xAznG+Vu5jE+abYOhN3CB/hAd8stqHV351VW0ZJBXIzSJH/9isTWy2V
         AflT0tL4JMopxmOzlutZLH0ULxN0bbcb5yw73ZOLQxaaurs1hoovBPd8YbQEBO/HhSwV
         Q1VA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/5] Misc fixes and updates
Message-ID: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
Date: Sun, 28 Mar 2021 17:48:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set consists of fixes/updates, some of which take care
of ebook-size build.

Patch 1/5 fixes truncated index pages in ebook-size build.
Patch 2/5 adds check of warning messages from makeindex, which are
sometimes hard to track down after the fact.
Patch 3/5 improves look of final pages of index.
I'd like final pages of chapters in two-column layout to be
balanced similarly, but have not succeeded.
Patch 4/5 fixes the wrong use of \Clnref{} macro, which I failed to
catch before the release of Second Edition.
Patch 5/5 fixes an orphaned heading of Section B.2 in ebook-size
build.

To build ebook-size PDF with index pages enabled, use the sequence
of command below:

    rm perfbook-ix.tex; env PERFBOOK_PAPER=EB make ix

Resulting perfbook-ix.pdf will be of ebook size.
As was mentioned earlier, make error due to messages of
"LaTeX Warning: Float too large for page by ..." is expected
and can be ignored.

        Thanks, Akira

--
Akira Yokosawa (5):
  index: Adjust settings respecting ebook-size build
  runlatex.sh: Catch warning from makeindex early
  index: Enable balanced layout of last page of multi-column index
  together: Fix usage of \clnref{} for 'lines M and N'
  toyrcu: Move float away from section heading

 appendix/toyrcu/toyrcu.tex | 10 +++++-----
 perfbook-lt.tex            |  8 +++++---
 together/applyrcu.tex      |  2 +-
 utilities/runlatex.sh      |  5 +++++
 4 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.17.1

