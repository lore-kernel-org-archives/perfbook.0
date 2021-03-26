Return-Path: <SRS0=Ra1/=IY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Go29wzxljYlfhWoXlOw1qNFJfvaScSlMGPSLfkIhZho=;
        b=V4rDl8asQITUbXGz7XC6qHAaGTgoeew2BM7X8mrrp3iBOxmWDK4IOqYlkCjU6mpg4R
         4b5r+KR+EfysWzCNE8Y8nRWRp8E4F+EGM9Ohv4wp2/IO9YK6aggt26Gi3Lf+ZsT1r9QW
         AuPxt9C9BRsysfXvws2Y8nv52uys5MxWKbNj9pARL0fgSJmRQNboO8Q9kmafbexRj/U6
         Nq1j/boajKD8xpsYfRXD0g/g2Z6+NJNFkwaj8plBOeb6Q4LJkYyLTMNYDKXXMaMA6s5a
         W2nndYQxxJVw+a8PzflyKtDzRxjER1Fr6TFpaAyMJ8eGq0UrqL2a+pFjcevmYo7vjM+W
         +ryg==
Subject: Re: [PATCH -perfbook 5/5] Makefile: Add info on ebooksize build in
 help and help-full
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <7c31e637-8a04-672d-71e5-3a3009e182f3@gmail.com>
 <20210326063503.GO77072@balbir-desktop>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <adfa150b-0cc9-034f-0e13-80e7d19502de@gmail.com>
Date: Fri, 26 Mar 2021 20:42:05 +0900
MIME-Version: 1.0
In-Reply-To: <20210326063503.GO77072@balbir-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 26 Mar 2021 17:35:03 +1100, Balbir Singh wrote:
> On Thu, Mar 25, 2021 at 08:00:07PM +0900, Akira Yokosawa wrote:
>> "(WIP)" will be removed size adjustments of floats are done.
>>
>> Also promote paper-size specific targets to "make help".
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  Makefile | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 415bcef3..16c85edf 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -500,8 +500,15 @@ help: help-official
>>  	@echo "Set env variable PERFBOOK_PAPER to change paper size:"
>>  	@echo "   PERFBOOK_PAPER=A4: a4paper"
>>  	@echo "   PERFBOOK_PAPER=HB: hard cover book"
>> +	@echo "   PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
>>  	@echo "   other (default):   letterpaper"
>>  	@echo
>> +	@echo "Paper size variations (independent of PERFBOOK_PAPER):"
>> +	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
>> +	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
>> +	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
>> +	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
>> +	@echo
>>  	@echo "\"make help-full\" will show the full list of available targets."
>>  
>>  help-full: help-official
>> @@ -510,6 +517,7 @@ help-full: help-official
>>  	@echo "  perfbook-lt.pdf,   lt:   2-column layout on letterpaper"
>>  	@echo "  perfbook-hb.pdf,   hb:   2-column layout for hard cover book"
>>  	@echo "  perfbook-a4.pdf,   a4:   2-column layout on a4paper"
>> +	@echo "  perfbook-eb.pdf,   eb:   1-column layout for ebook reader (WIP)"
>>  	@echo
>>  	@echo "Experimental targets:"
>>  	@echo "  Full,              Abbr."
>> @@ -540,8 +548,9 @@ help-full: help-official
>>  	@echo "  - Set env variable PERFBOOK_PAPER to change paper size:"
>>  	@echo "      PERFBOOK_PAPER=A4: a4paper"
>>  	@echo "      PERFBOOK_PAPER=HB: hard cover book"
>> +	@echo "      PERFBOOK_PAPER=EB: ebook reader, always 1c layout (WIP)"
>>  	@echo "      other (default):   letterpaper"
>> -	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", and \"a4\".)"
>> +	@echo "    (PERFBOOK_PAPER has no effect on targets \"lt\", \"hb\", \"a4\", and \"eb\".)"
>>  
>>  clean:
>>  	find . -name '*.aux' -o -name '*.blg' \
>> -- 
>> 2.17.1
>>
> 
> Acked-by: Balbir Singh <bsingharora@gmail.com> 
> 

Thanks, to be applied to 5/5.

Paul, what is your idea on this patch set?
I can send a v2 with Balbir's acked-by,
but apparently, you can directly pick it.

And to which branch are you going to push?
For example, shrinking floats can be done on a topic branch,
for example named "ebooksize", and will be merged later once
the build warnings are all resolved.

Another idea is to merge it now, because existing build
targets won't be affected by this and later changes.

Thoughts?

        Thanks, Akira 
