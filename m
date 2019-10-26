Return-Path: <SRS0=nXUX=YT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=e6dQkIWBKmODcu1wcUjwWOWn2ZQXwXo0mKx9YaKQRAk=;
        b=iVbZ2utJODq2tEEZCgxxHXDvhZW7Eh1ukmHtHjQ1I1RHJ+rv1Ilr0IpYlY6tYz1q9X
         DqeZrU4yKcpUmCWiddlefMuILHhpQ5RU0PVG4ixkIC3iDzpkEv5jyYz955B4ITY74R9A
         e8OwlrpxAnWpvboQw630/W3qupKaduuB06DNFysXlWmjsQK8ZTN3iS7ppby5bgcnEMOg
         TjasDi12yFEGZ9a7T4DU+XwuSkJyq5zQPwa4xdNfkrUWpfDq4mOb761znuKbxQHEDxo7
         Fl5/MyO3KMsbZDo7URICdzerUl2h8Sx6VoUXFr8bY7vIP6Hi3+nKpnbW5xybuDG7yoGK
         2OKg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Fixes to recent updates in count
Message-ID: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
Date: Sat, 26 Oct 2019 09:18:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So you had (or still have?) a chance to run the parallel count algorithms
on the large x86 (224-core with HT) system. Interesting data.

This patch set is to adjust a few contexts with existing contents.

Patch #1 adjusts horizontal spacing of tables getting wider than 1c
column width.
Patch #2 adds a dashed line mentioned in Quick Quiz 5.8.
Patch #3 substitutes "x86" for "POWER6".

If you have conflicting local updates, I'd be happy to rebase.

Also, you might want to add a Quick Quiz on the slope changes in
Figure 5.1 at number of CPUs 2 and 28. I think you know what I mean.

        Thanks, Akira
--
Akira Yokosawa (3):
  count: Tweak horizontal spacing of wide tables in 1c layout
  count: Add dashed line indicating ideal time of (non-atomic) increment
  count: Update CPU type/system

 CodeSamples/count/atomic_hps.eps | 111 ++++++++++++++++++++++++++++++-
 CodeSamples/count/atomic_hps.png | Bin 3113 -> 3120 bytes
 CodeSamples/count/plots.sh       |   2 +-
 count/count.tex                  |  12 ++--
 4 files changed, 117 insertions(+), 8 deletions(-)

-- 
2.17.1

