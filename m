Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Uzl9ibaz9j6xEOdbuROaZiNq/oRURLzjP24/Uy6APiA=;
        b=j98uIEo2hWO3Bdt/Sf9RBcnTLTPInR5DjWa2d4JhSaDGAfuEBmLgRnqMlBtEpqS9AY
         Us8MKAQSL+8KUAM7hC7pcGrozocbWl7FdQSWuK/YWZwhGOoz6ZUjIj3I1I3BvxOIQxI9
         ksGB+tQzSLS2qPD1ZQb3cIDnhUJXR1z5eCKbmmi+HrfCEwU6fHyCGIoDXY8w4GukUd3d
         ZTZqsgevakcTNSfeo7WCaiia/EAt8DxjdpEliCDJSB7CVZPufwiU5DqYd3zhnYjPMIiU
         D7FtF9F+3nklMRDStAsvg5+tgaG7IlyNhhw6GObCBa5WmFdA927D4O2Rv7Mdk6LKB+Gc
         aOtg==
Subject: [PATCH 0/3] formal/dyntickrcu: Followup changes
References: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
Date: Tue, 9 Apr 2019 00:44:20 +0900
MIME-Version: 1.0
In-Reply-To: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is a followup patch set relative to the workaround patch
in this mail thread ("formal/dyntickrcu: Mitigate ugliness around
tall inline snippets").

Looks like you have not pushed it yet, though.

It turns out that I misunderstood the working of \AtBeginEnvironment{}
command, and patch #1 fixes the way to redefine VerbatimN environment.
I wanted to add a Fixes: tag, but I don't have the commit id, so
I put a stub of "xxxxxxxxxxxx" in the change log. Can you replace it
with the actual commit id?

Patches #2 and #3 add references to the git commits of the fixes to
bugs in preemptive RCU found by verification. The actual changes were
a little bit different from what are presented in inline snippets,
but I left the snippets as are.  As they are more than a decade
old, adding references should help the context look more real.

        Thanks, Akira
-- 
Akira Yokosawa (3):
  formal/dyntickrcu: Fix the way to redefine VerbatimN
  RCU.bib: Add entries of git commits of dyntickrcu fixes
  formal/dyntickrcu: Cite git commits of dyntickrcu fixes

 bib/RCU.bib           | 22 ++++++++++++++++++++++
 formal/dyntickrcu.tex | 12 ++++--------
 perfbook.tex          |  5 ++++-
 3 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.17.1


