Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D1fxFCa/LB4AvSFhZdofdT9+jhIRAKJIm1e1eXZvkRI=;
        b=Z1zfOyNv5Jexw9SfBBQzS3qTuVyZQDOfw350FDBh8FqmeHy4S0FsHJNr02NgvkvkFw
         PSNkyntJBD7kw3bsZrLq5yucVS95lPrdXHAoZWfWKN+Pub54Tw46us/JhGfTHTxhtc+Y
         kUCcPQm3l2ntpks6GJiYhWgfdN1LlFIw6meVdUt2YEVjtZ96Vf7OweXw8VJPGdVM4Thz
         CcD35oxha94GdY1uWLvnu6IC3HW06y9H7cSgpVLu/eoDL5Nebg7aUK9liHfWbWo+AdL/
         O7rYL6GERSo6jdtTUHE1jwmFhxh80y4xggLjMcuizxgQvZ/FNsD7myFBH4rum3Ty02Rd
         eE/w==
Subject: Re: [PATCH 0/5] Misc updates
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
 <20181001151810.GY4222@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <17f8f5c6-3c41-0a6f-9665-57abb57fe887@gmail.com>
Date: Tue, 2 Oct 2018 00:26:16 +0900
MIME-Version: 1.0
In-Reply-To: <20181001151810.GY4222@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/01 08:18:10 -0700, Paul E. McKenney wrote:
> On Mon, Oct 01, 2018 at 10:48:48PM +0900, Akira Yokosawa wrote:
>> >From c545a33aea39aeae40bcff478285f814c32a4456 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 1 Oct 2018 22:05:58 +0900
>> Subject: [PATCH 0/5] Misc updates
>>
>> Hi Paul,
>>
>> This is a miscellaneous collection of updates.
>>
>> Patch #1 fixes build error you'd encounter when you do "make"
>> after doing "make" under CodeSamples/ directory.
>>
>> Patches #2 and #3 fix trivial typos in FAQ-BUILD.txt and
>> tooldoftrade, respectively.
>>
>> Patch #4 removes obsolete workaround code in perfbook.tex.
>>
>> Patch #5 removes rules in Makefile used to support a hi-res
>> figure in QC section.
>>
>> Once Patch #5 is applied, you can remove orphaned files listed
>> below:
>>
>>     future/Bloch_Sphere.svg
>>     future/QC-FormConstant.eps
>>     future/QS1_1.svg
>>     future/T2h1lc19xmqrdlsor.eps
>>     future/ibmqx2-labeled.svg
>>
>> As a matter of fact, I have prepared a patch to remove
>> them, but it would be too large to submit.
> 
> Applied and queued them, along with a sixth patch to remove the above
> files with your Suggested-by, thank you!!!
> 
> I never have tried it myself, but they say that the -D argument to
> "git diff", "git show", and "git format-patch" will create a summarized
> patch that can then be pulled in by "git am" and friends.  If either of
> us remembers next time, we can try the experiment.  ;-)

man page of git-format-patch says the following on the -D option:

       -D, --irreversible-delete
           Omit the preimage for deletes, i.e. print only the header but not
           the diff between the preimage and /dev/null. The resulting patch is
           not meant to be applied with patch or git apply; this is solely for
           people who want to just concentrate on reviewing the text after the
           change. In addition, the output obviously lack enough information
           to apply such a patch in reverse, even manually, hence the name of
           the option.

So, I'm not sure if the resulting patch can be applied by "git am".
Or can a recent version of git handle such patches?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (5):
>>   CodeSamples: Exclude meta command lines in building api.h
>>   FAQ-BUILD.txt: Fix typo
>>   toolsoftrade: Fix typo DEFINE_PER_THREAD() -> DEFINE_PER_CPU()
>>   Remove workaround for Fedora 23 Tex Live bug
>>   Makefile: Remove rules for QC section
>>
>>  .gitignore                    |  1 -
>>  CodeSamples/Makefile          |  4 +++-
>>  FAQ-BUILD.txt                 |  2 +-
>>  Makefile                      | 25 +++++--------------------
>>  perfbook.tex                  | 14 --------------
>>  toolsoftrade/toolsoftrade.tex |  2 +-
>>  utilities/gen_snippet_d.pl    | 16 ++++++++--------
>>  7 files changed, 18 insertions(+), 46 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 

