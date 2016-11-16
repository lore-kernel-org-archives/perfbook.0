Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=PVZgRWUHKtqgg3QsVvmpL+3fQ2NBkb3nobf8u6rdagM=;
 b=n47MNc4XTPLGkpUSpUwc26C2XbIVpw5ATJHNJ9mYXlXJH3zUX7ogYkOkNqIKlrpFpB
 NfO6HX7+YGe82bQ2KUJTrb2dka9yvPB8zabC8bDQ37/LkKK8Vc762Gp3/2O+60kp1fyj
 NS0NqeyUmZlEg/6mAbk1hxe5YYrKkI721XNIckBFiREWztUuX0hEOSYnBCi5/B/9cVgx
 ZUF8NlhbmSWiiYVmLrtgB1bHl1JDWfOhWiQTu30fHBnw5MTVTc49zi573mHy00qMwHS3
 V+sPkkltLyUqjlBGUyqYTUynu2f1u6D90/PNibtZjTstB+7vVbZ8RP36ZQvUr75vQMG4
 paBw==
Subject: Re: [PATCH 0/3] Adjust labeling of chapter and appendix
References: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
 <20161116151046.GG3612@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ebfc7992-2384-6e37-a301-9d519aa1bef7@gmail.com>
Date: Thu, 17 Nov 2016 07:26:17 +0900
MIME-Version: 1.0
In-Reply-To: <20161116151046.GG3612@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/11/16 07:10:46 -0800, Paul E. McKenney wrote:
> On Wed, Nov 16, 2016 at 09:57:08AM +0900, Akira Yokosawa wrote:
>> >From 08d86c4db893e5b689c4d051b765006ce507c45c Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 16 Nov 2016 09:43:11 +0900
>> Subject: [PATCH 0/3] Adjust labeling of chapter and appendix
>>
>> Hi Paul,
>>
>> "bib" cleanups aside, I noticed a few inconsistent labeling of
>> "formal" and "whymemorybarriers".
>> This patch set adjusts them.
> 
> Good catches, applied, thank you!

You are welcome!

BTW, did you miss the patch "[PATCH] bib: Fix several typos" from Tobias
dated "Tue,  8 Nov 2016 10:46:10 +0100"?

I'm asking because you almost always respond within a few days.

You missed the previous patch set from Tobias. Does a spam filter or something
prevent you from receiving it?

You can see the mail archived at:
http://www.spinics.net/lists/perfbook/msg00595.html.
(with mail address obfuscated)

                                                    Thanks, Akira

> 
> 							Thanx, Paul
> 
>>                                           Thanks, Akira
>>
>> ---
>> Akira Yokosawa (3):
>>   formal: Promote \OriginallyPublieshed macro to Chapter
>>   appendix/ack: Adjust labeling in 'Reviewers' section
>>   treewide: Adjust labeling of 'formal'
>>
>>  appendix/ack/ack.tex            | 8 ++++----
>>  appendix/rcuimpl/rcupreempt.tex | 2 +-
>>  debugging/debugging.tex         | 2 +-
>>  defer/toyrcu.tex                | 2 +-
>>  formal/dyntickrcu.tex           | 2 +-
>>  formal/formal.tex               | 2 +-
>>  6 files changed, 9 insertions(+), 9 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 
> 

