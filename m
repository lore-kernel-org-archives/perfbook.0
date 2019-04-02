Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=P0LVGJF2MthpAwIaApFu+/4eAT9CJ2/2KjswAynp+0Q=;
        b=blP08bVE0lR7S6pXnN6ti0M9UmpZM1ORZVT9rpyt2OxgkOthoxSPc5jF/qX2Gk7/Tk
         TxLHJrM62qGpstIF5qpLHJOHoHYpkzGq24SlXEzGF6ipzk2F3y/kk83DGuIiPBiUc0F+
         UFq2qgVsKz2Ax1PKW3Q+ynA8fTwZwZtzcTw3c2urTUaEupRUXlckrPMGbI8OD/ip+bwE
         DkXoNBwjcEkxfIOesnLdmuK8g4gFBe5iRzLCitWk4zJj15XNGjMQ7t4b8biQTKv+O3r3
         3q+yFAeL1l8ZcKt1EtlYWJCcQ2dXq00uPtyajulsJTOcCYH9tG9ih0U4QconCzw/iV50
         CMjQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] formal/dynticks: Employ new scheme for code snippets
Message-ID: <0245f4c8-5ab2-4622-3e88-a13d64dfccdd@gmail.com>
Date: Wed, 3 Apr 2019 00:48:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

The updates of code snippets in formal/dynticks has become a long branch,
and I'm sending this as a pull request.

Short summary of the changes follows.

Patch #1 is an independent update of mpostcheck.sh to suppress false
positives on TeX Live 2019, soon to be released this month.

Patch #2 updates inline (not extracted from CodeSamples) snippets.

Patches #3 and #4 enhance fcvextract.pl to easily suppress brank lines
from resulting snippets.

Patch #5 updates code snippets extracted from CodeSamples.

Patch #6 updates dyntickRCU-base-sl-busted.spin.trail.txt so that
the line counts in the output matches thoes in the updated .spin source.

Patches #7--#9 are cosmetic fixes and tweaks.

Patches #10--#14 are workaround tweaks to keep first paragraphs
in sections non-indented when such sections have a floating listing
environment at the beginning. This was an unfortunate regression
in the conversion of schemes using verbbox to those using VerbatimL.
Another option would be to indent every paragraph including the first
one in sections. My preference is to keep first paragraph non-indented.
The use of "\NoIndentAfterThis" just below the section command looks
acceptable to me. Note that it is not robust enough, and there are
two occasions where I need to use \noindent in front of the text of
first paragraphs.

Patch #15 adds a trivial nbsp.

Any feedback is welcome!

        Thanks, Akira
--

The following changes since commit 71ac1532e501033d9cf6e72d596a307b7df3df4a:

  toolsoftrade: Fix code listing 4.22 in Chapter 4 (2019-03-19 08:15:52 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git formal-dyntick-snippet-update-r4

for you to fetch changes up to 5e2615cf082480f7a0c79f6b873f37c379c24722:

  formal/dyntickrcu: Add nbsp (2019-04-02 07:53:31 +0900)

----------------------------------------------------------------
Akira Yokosawa (15):
      Update mpostcheck.sh to get ready for TeX Live 2019
      formal/dyntickrcu: Employ new scheme for inline snippets
      fcvextract.pl: Add rule to ignore white spaces around comment block
      fcvextract.pl: Add rule for option 'gobbleblank'
      formal/dyntickrcu: Employ new scheme for code snippets
      formal/promela/dyntick: Update .spin.trail.txt file
      treewide: Define and use \rt macro for '-rt'
      formal/dyntickrcu: Tweak appearance
      formal/dyntickrcu: Remove '()' in state names
      formal/dyntickrcu: Tweak indent behind 'listing' environment
      count: Tweak indent behind 'listing' environment
      SMPdesing, locking: Tweak indent behind 'listing' environment
      datastruct, defer: Tweak indent behind 'listing' environment
      formal/spinhint: Tweak indent behind 'listing' environment
      formal/dyntickrcu: Add nbsp

 .../formal/promela/dyntick/dyntickRCU-base-s.spin  |   37 +-
 .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   35 +-
 .../dyntickRCU-base-sl-busted.spin.trail.txt       |  144 +-
 .../formal/promela/dyntick/dyntickRCU-base-sl.spin |   17 +-
 .../formal/promela/dyntick/dyntickRCU-base.spin    |   46 +-
 .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   60 +-
 .../formal/promela/dyntick/dyntickRCU-irq-ssl.spin |   41 +-
 .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   91 +-
 SMPdesign/beyond.tex                               |    1 +
 advsync/rt.tex                                     |   30 +-
 count/count.tex                                    |    5 +
 datastruct/datastruct.tex                          |    5 +-
 defer/rcuapi.tex                                   |    6 +-
 defer/rcuusage.tex                                 |    3 +-
 formal/dyntickrcu.tex                              | 1733 +++++++-------------
 formal/spinhint.tex                                |    3 +
 locking/locking.tex                                |    3 +
 perfbook.tex                                       |    1 +
 utilities/fcvextract.pl                            |   25 +
 utilities/mpostcheck.sh                            |   16 +-
 20 files changed, 897 insertions(+), 1405 deletions(-)

