Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=R4U9PgzXFpcGQQiDROSX3kq3sd/LajkS9CLrDG7MIuo=;
 b=HOW4LLENREGtQ5aReTge63bA1zEZVu7VV3sINQxbEi0R6JA1BK5c29ytpro1X+SNv0
 aiQ0TSMrU7DkB4fkvyCTk4fsJ23Y6ZYLyHaUerUDaGlo1lJ2GqAnHyNxMqRmZVp0ce6T
 Lzkr4uILxfm4bGaO0EuslrhVHO29OVakoFkJr+tbaqKBLyQZhNrHwDb8q1UjD9H+JguK
 /sIgIoeRUekhTk95lTT9ihlhr1JihBxtIDHHm7F1YcFiGgh+bFXr+Ur+VPm8JhoE5IIF
 tuYqRE4RlxT4RrCpHbgrt1TtJbDb0mMGpP8SXHlm0sn/P0TkUoYBGJe3p4Uohaj+2I30
 cAQw==
Subject: Re: [PATCH v2] autodate.sh: Use printf command instead of echo
References: <20170116234125.28692-1-twoerner@gmail.com>
 <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
 <898ffe7c-cc25-773d-28a1-ff9c7f9c97e0@gmail.com>
 <20170119023317.GA15981@linux-uys3>
 <5611d557-8d79-e767-3b1e-085c7aceb0c3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <966495e1-22c2-9573-e49c-c08663b3437f@gmail.com>
Date: Sat, 21 Jan 2017 00:01:59 +0900
MIME-Version: 1.0
In-Reply-To: <5611d557-8d79-e767-3b1e-085c7aceb0c3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/01/19 20:16, Akira Yokosawa wrote:
>>From b981648ff25387ecea68b55350671c55ad894884 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 17 Jan 2017 20:04:54 +0900
> Subject: [PATCH v2] autodate.sh: Use printf command instead of echo
> 
> Using "echo" command to generate output containing "\" characters
> caused a build error depending on the variant of "sh".
> For portability, we should use "printf" via "env" command.
> 
> Fixes: 878bf8160a5c ("Make date of git commit be reflected automatically")
> Reported-by: Trevor Woerner <twoerner@gmail.com>
> Tested-by: Trevor Woerner <twoerner@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> v2: Changes in commit log
>       o Tested-by from Trevor
>       o Title of fixed commit

Well, seems like I should have put the "Tested-by:" from Trevor
below my "Signed-off-by:" to respect the chain of event.
If it is not too late, can you reorder them for me?

                                      Thanks, Akira                     

> 
>  utilities/autodate.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 6df8f99..a56bc70 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -35,7 +35,7 @@ else
>  	gitstatus=`git status --porcelain | wc -l`
>  	if [ $gitstatus != "0" ]
>  	then
> -		modified=" (m)"
> +		modified="(m)"
>  	else
>  		modified=""
>  	fi
> @@ -44,5 +44,5 @@ month=`date --date="$date_str" +%B`
>  year=`date --date="$date_str" +%Y`
>  day=`date --date="$date_str" +%e`
>  
> -echo "\\date{$month $day, $year$modified}"
> -echo "\\\newcommand{\\\commityear}{$year}"
> +env printf "\\date{%s %s, %s %s}\n" $month $day $year $modified
> +env printf "\\\newcommand{\\\commityear}{%s}\n" $year
> 

