Return-Path: <SRS0=Ej0c=IQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mScwBYXTW7UjcTeluT01K4O3DToYsNbdCJwUTLxHgjo=;
        b=N4i1sce6tfKrR+89Z6d3zaW/XoTRYpQv+xMbrrgQj2/C9hmAAH+0cY6pTJj9w7W/Bz
         IVIwnuRJ7nocambozOF765DYPHN0iJzn+CS1k/qGg9NpKp7v8JNnwhJ8FXXAzMTX7gyn
         AzaZzlo9SuI7rL4PkcC3+0mas0d2OuVPTkbFJteDxqMsTihK2XBHtBGmoi6UaAwkRc67
         kSAsgTmVFXKYY9SmDhWe++WYEi/dG+ASa+A1cAqwSm/SQkKrkzIF5ry+jUIkrv9he118
         sb9W2QrybJMu8GTMpv97dAK/+gczpUm0MdOTc1VdYRVBTYvYIxf9qKny+0LcSAoqOEBn
         vXeA==
Subject: Re: [GIT PULL -perfbook] Minor tweaks and styleguide update for
 Edition 2, take 4
References: <1bab2519-02be-a38c-0d20-ac40567c084e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <095ffc25-da49-7742-b7b9-8772ff1899e9@gmail.com>
Date: Thu, 18 Mar 2021 22:46:18 +0900
MIME-Version: 1.0
In-Reply-To: <1bab2519-02be-a38c-0d20-ac40567c084e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I added a section on full stop spacing example in styleguide.
There were a couple of typo fixes in memorder.

This is relative to the earlier pull request of take 3.

Typo fixes are intentionally divided as individual commits.

        Thanks, Akra

--------
The following changes since commit 194bd0a454fc3ca2e6d50c39c248e35fd24ff61a:

  datastruct: Remove redundant line (2021-03-18 10:01:20 +0900)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.18d

for you to fetch changes up to a70d76c76d8e3b4338f813da9ddfb8fa880a653c:

  memorder: Fix usage of \pageref{} (2021-03-18 22:14:28 +0900)

----------------------------------------------------------------
Akira Yokosawa (6):
      styleguide: Use \Cref{} at start of sentence
      sytleguide: Add a section on full stop
      memorder: Fix typo
      memorder: Fix typo
      memorder: Fix typo
      memorder: Fix usage of \pageref{}

 appendix/styleguide/styleguide.tex | 83 ++++++++++++++++++++++++++++++++------
 memorder/memorder.tex              |  8 ++--
 2 files changed, 75 insertions(+), 16 deletions(-)

