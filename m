Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=zzSGB6aU5cDMFxzPoTYcA1oMsbldQxUZjsiKx2OHD1s=;
        b=JTqezX9rKczwRdDseF1OMscfBPUaI37W9xfLIzk/rhGf526Jl4ijhhsMaof4CAge3x
         YkbcgZEzPvPYCObKTr2b7iSA/q5LtlaJl8U6vO3RRryEXIDZbCoQdehMXMhGOgQYBz9T
         HeqSwnEGel//LlFXdpyoqNUQrffhIi/lUTwh0qgb0cEJ9zPjYT6FxIK4q1qeMnQiAI2w
         fYbQsPVVJG95GnEcDTxsukM5AawxvnYsF33qFVS2SFTI81+dErSDxlhjy7bA6cck4bYJ
         XPa7ARis8pkOgK1bHwTeSxB7YAGo+vg9c1yhp0Q+jam31iaC2NVAdqXYWncLhxDaHMtI
         QaYw==
Message-ID: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Date: Tue, 25 Jan 2022 18:56:27 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/6] index: Add several major tags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here are another set of patches WRT indexing.

Patches 1/6 and 2/6 add indexing tags for major references to
"NBS", "forward-progress guarantee", "livelock", "starvation",
and "unfairness".

Patch 3/6 adds API indexing tags to historic lockless_dereference().
Patch 4/6 fixes a typo found while preparing Patch 5/6.
Patch 5/6 adds major and minor tags to "(anti-)heisenbug".
Patch 6/6 reforms hierarchical indexes under "Memory consistency"
to those under "Consistency".

Patch 5/6 needs the \IXalth{}{}{} macro as \IXh{anti-}{heisenbug}
would put a space between the two arguments in the text.

        Thanks, Akira
--
Akira Yokosawa (6):
  advsync: Add major indexing tags to 'NBS' and 'forward-progress
    guarantee'
  locking: Mark major references to 'livelock', 'starvation", and
    'unfairness'
  memorder: Add indexing tags for historic lockless_dereference()
  debugging: Fix typo (heisenberg -> heisenbug)
  debugging: Add indexing tags to '(anti-)heisenbug'
  index: Reform indexing tags related to 'memory consistency'

 advsync/advsync.tex      | 8 ++++----
 debugging/debugging.tex  | 7 ++++---
 future/formalregress.tex | 2 +-
 glossary.tex             | 6 +++---
 indexsee.tex             | 7 +++++++
 locking/locking.tex      | 8 ++++----
 memorder/memorder.tex    | 8 ++++----
 together/seqlock.tex     | 3 +--
 8 files changed, 28 insertions(+), 21 deletions(-)


base-commit: 641067ba70383ad751512bd02cfc7cec17647523
-- 
2.17.1

