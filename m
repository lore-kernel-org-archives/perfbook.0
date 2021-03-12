Return-Path: <SRS0=E7ue=IK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iafja2H9FA2iGtG75LN9p8IYjtlBc76NsQovud0hY8o=;
        b=eZAOfjh3XU6LReExwPI7a0XaM75xpi6xKKAr57Iy6H71z97ihGZ1HH5fIcib1Fupsi
         conmb1LiHsSvJyHqjb51/gQloBrTaqSMxZ9OTUa59Wtsom6ofQ/2m2CX7vuv5bnkf6AG
         zsofHFWXUr78DbbJhBUBLhqbAsDz2ElqmJfHWOS1XeSdFVGOOc56sEyvc/OnV6rOdRXU
         /V/A9Vdz+ygnOYhBovhU0ClJrpn8PY5m2n0pnAZVvWtqHHu5ezakyhdxcfxYEnQtPXRA
         wJSexBPg8csoPz5ncZre0UNMzIEzHzXWdbR2JgI4SKg3dbpF100rplIjD5S2KIjkBx6P
         RZkw==
Subject: Re: [GIT PULL -perfbook] Minor tweaks for Edition 2
References: <b4d385ab-fced-17e5-6af0-ecd0e05260fa@gmail.com>
 <20210312022558.GC2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <daae0a43-94b9-5cee-cee9-4e1da580d386@gmail.com>
Date: Sat, 13 Mar 2021 00:12:36 +0900
MIME-Version: 1.0
In-Reply-To: <20210312022558.GC2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 11 Mar 2021 18:25:58 -0800, Paul E. McKenney wrote:
> On Fri, Mar 12, 2021 at 09:03:23AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> So this is a collection of minor updates/tweaks for Edition 2.
>>
>> Patch 1/9 adds an author field in a bibliography entry.
>> Patch 2/9 fixes font in a epigraph.
>> Patch 3/9 adjusts position of a sideways table with a typo fix.
>>
>> Patches 4/9 -- 7/9 tweak float positions and line breaks mostly for
>> 1c builds.  They affect 2c build as well.  If you find any undesirable
>> changes in 2c builds, please let me know.  I'll give a closer look.
>>
>> Patch 8/9 removes adhoc tweaks which have become irrelevant.
>> Patch 9/9 restores a2ping in a recipe for ghostscript 9.53.x.
>> It turned out that a2ping can cope with the up-to-date ghostscript.
>>
>>         Thanks, Akira
> 
> I merged these in, thank you!
> 
> Is a second-edition release date of this weekend reasonable, or should
> I hold off for another week to allow more review?

Another week sounds reasonable.
I'm not saying I can review all of your recent updates in a week,
but most rough edges can be fixed.
I've already spotted a few issues in the brand new summary chapter.

BTW, It was good to know why you started perfbook.
The year 2021 means quite a lot for you, I suppose.

        Thanks, Akira

>
> 							Thanx, Paul
> 
>> --
>> The following changes since commit 736cfb826271d7e25b45859cf793d4c7749d024b:
>>
>>   appendix/questions: Updates and wordsmithing (2021-03-09 17:24:47 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.12a
>>
>> for you to fetch changes up to c337d0756f8862f981eab9f67262d39371769dbe:
>>
>>   Makefile: Restore a2ping for .tex originated .eps files (2021-03-12 08:27:17 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (9):
>>       bib/syncrefs: Add author info to AndrewDBirrell1989Threads
>>       defer/updates: Use \emph{} for author part in epigraph
>>       defer/rcuapi: Fix position of 'RCU Wait-to-Finish APIs' table
>>       Use nbsp for 1c builds
>>       Use 'tbp' as option of floats
>>       Add \FloatBarrier to avoid far-away floats
>>       easy: Shrink and move 'Mandelbrot Set' figures
>>       Remove '\noclub[1]' tweaks
>>       Makefile: Restore a2ping for .tex originated .eps files
>>
>>  Makefile                      |  4 +++-
>>  advsync/rt.tex                |  1 +
>>  appendix/toyrcu/toyrcu.tex    |  8 ++++----
>>  bib/syncrefs.bib              |  1 +
>>  debugging/debugging.tex       |  1 -
>>  defer/rcuapi.tex              |  4 ++--
>>  defer/rcufundamental.tex      | 10 +++++-----
>>  defer/updates.tex             |  2 +-
>>  easy/easy.tex                 | 18 +++++++++---------
>>  future/future.tex             |  2 ++
>>  future/tm.tex                 |  8 ++++----
>>  intro/intro.tex               |  6 +++---
>>  locking/locking.tex           |  1 -
>>  memorder/memorder.tex         | 41 +++++++++++++++++++++--------------------
>>  perfbook-lt.tex               |  3 ++-
>>  toolsoftrade/toolsoftrade.tex |  4 ++--
>>  16 files changed, 60 insertions(+), 54 deletions(-)
