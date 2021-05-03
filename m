Return-Path: <SRS0=icZD=J6=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HKCMIZ9xvPCMU59ztw2uaCDfkhY6KKOhcMXvQf7Nras=;
        b=Tz8Z/Wk3oGcUuEBUvZKNl0H3V3DseCgj93SRRh5QuJfOFZGA3WlNjoXDpCMSu4DdZU
         rBZkePBg5Jg2B0TPQA6CSYt+uN0UNgDkOIpRP4JXZTkk2BNUd5+BoD6efbnUGpogbNT+
         kdOvt2MrtH+PAc7NeAg9ZAWqx/N6gyCeKkR0g13dZSlobteNzd6DDaTPXu8+ovkNDjan
         K6Ia16a3pzVcsJRMlDuFTgpiwrwuF6+sEk92qfdLtuXIzzhLsZHae6GZTKgYs71BUY2Y
         TDGhgOFUS5OlAFYTQq/hZv4H3UEgsHYFCrBe8u8YTvW8NmU5fxCN9KQgWC3MoRwgBezH
         dzBg==
Subject: Re: [PATCH -perfbook] utilities/autodate.sh: Fix potential hung-up on
 missing tcolorbox
References: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
 <0b71604e-5b51-c53a-57ce-d97a7dbaf620@gmail.com>
 <20210502163840.GO975577@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5454e927-7a9f-48ff-a8ba-03b3f9bde1dd@gmail.com>
Date: Mon, 3 May 2021 09:56:03 +0900
MIME-Version: 1.0
In-Reply-To: <20210502163840.GO975577@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 2 May 2021 09:38:40 -0700, Paul E. McKenney wrote:
> On Sun, May 02, 2021 at 08:59:43PM +0900, Akira Yokosawa wrote:
>> On Sun, 2 May 2021 20:40:42 +0900, Akira Yokosawa wrote:
>>> "kpsewhich tcolorbox.sty" can be empty if tcolorbox is not
>>> available.
>>>
>>> If this is the case, "grep" in `grep ProvidePackage | sed ...`
>>> will wait forever.
>>>
>>> Add an empty check in front of "grep" with exit code of 1.
>>
>> Paul,
>>
>> Please ignore this patch.
>> I'll respin soon.
>>
>> Sorry for the noise.
> 
> Ignored, and no problem!  Been there, done that!  ;-)

Patch v4 I just sent out should be good enough.
I'm afraid you don't have a handy environment to test the error path,
but I did uninstall texlive-tcolorbox on a Fedora container
and confirmed the error check works as expected.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> -- Akira
>>
>>
>>>
>>> Fixes: b2f19231bcc5 ("utilities/autodate.sh: Make newer tcolorbox behave as before")
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> ---
>>>  utilities/autodate.sh | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
>>> index 7bd7cbb8..2b9c1117 100644
>>> --- a/utilities/autodate.sh
>>> +++ b/utilities/autodate.sh
>>> @@ -97,6 +97,13 @@ env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
>>>  
>>>  # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
>>>  tcolorbox_sty=`kpsewhich tcolorbox.sty`
>>> +
>>> +if [ "$tcolorbox_sty" == "" ]
>>> +then
>>> +	echo "Error: package 'tcolorbox' not found. See See #9 in FAQ-BUILD.txt" >&2
>>> +	exit 1
>>> +fi
>>> +
>>>  tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
>>>  tcbold=4.39
>>>  env printf '%% tcolorbox version: %s\n' $tcbversion
>>>
