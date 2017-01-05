Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=M0dAIkaN57F9KQ9PAF05EpjCZHefMR+VkMGFIn5Ozyc=;
 b=vXvKg8sm2qRxfEjxjU8h2PsleY2ySZS3MHHrzCtKmK8mEB9nNSA3CArFs+Dd9YZegF
 fff+P9NIKAchOGNm9//Ee7z/OXZUpPuE4GWna7FzqeBGQ0G9aSV2bZMvSFwNH4++X0ra
 CgLYaytkeKGC4Wk+x3QJY2ol29NYbBasWu4f8vHcDM0SAsApeyW+aqwoWoPdJQRpzlRM
 /TuOBGFHZuclVr51x2919N5EIW/nppRCanAve5i3Yfryp+2QwAjMZQcgFc9+uHtmpXsW
 40ZlNzXtU5ygmOV+NuOZuy00UUUgRgliEq1L4DOymqT+Rml3H0xHFyZI7Zy83ThXAV64
 KyVA==
Subject: Re: [PATCH 0/5] Promote target 'mss' to default
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
 <20170105051835.GA3742@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5d48139a-2eda-54de-63bc-d76c9b0dca37@gmail.com>
Date: Thu, 5 Jan 2017 20:49:58 +0900
MIME-Version: 1.0
In-Reply-To: <20170105051835.GA3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/01/04 21:18:35 -0800, Paul E. McKenney wrote:
> On Thu, Jan 05, 2017 at 09:27:57AM +0900, Akira Yokosawa wrote:
>> Hi, Paul
>>
>> As I mentioned, I'm submitting a patch set to switch default
>> monospace font to "couriers" (courier scaled).
>>
>> Patch 1 does the switch.
>> Patch 2 adds a new target "help" that explains various targets.
>> Patches 3 and 4 revert manual fontsize tweaks.
>> Patch 5 encloses a short verbatim definition in a minipage, It was
>> a bit too wide with non-scaled courier, but now it is safe to
>> be indented as a paragraph.
> 
> Thank you, queued and pushed.  I added a fixup patch for what looked
> to me to be typos in the Makefile help text (which is a very nice
> addition, by the way!).  Please let me know if my fixes need fixing.

Thanks for the fixes!
                                 Akira

> 
> 						Thanx, Paul
> 
>>                                         Thanks, Akira
>> --
>> Akira Yokosawa (5):
>>   Promote target 'mss' to default
>>   Makefile: Add target 'help'
>>   Revert "after: Tweak font size of Figure A.2"
>>   Revert "formal/dyntickrcu: Adjust font size of sample code"
>>   toolsoftrade: Enclose short verbatim in minipage
>>
>>  Makefile                      | 45 ++++++++++++++++++++++++++++++++++---------
>>  appendix/questions/after.tex  |  2 +-
>>  formal/dyntickrcu.tex         |  2 +-
>>  perfbook.tex                  |  2 +-
>>  toolsoftrade/toolsoftrade.tex |  4 ++--
>>  5 files changed, 41 insertions(+), 14 deletions(-)
>>
>> -- 
>> 2.7.4
>>
> 
> 

