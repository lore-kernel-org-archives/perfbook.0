Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gT2ePZGYAFWuMsX3BfeXbVJs8m8mVj10Uj8LBZ14RE0=;
 b=Hrjl1EexPJhyt8A1cH1pPADnEC72HqyFwlJDooK/AP4a5FGkz+4xxjCY+fb61VlM8d
 nEJpALjbXPhUDnEfyOHwHiu9A5WyxuKIKES2X4RpbCnZQmvmS0LqURHh+tCuidPYNE51
 ZYs8Ix4OhYAGOLDzDLzczH9ZvoSQY+tw8x4F3TsXSnjHv5RZhgg2Yi5+idYFgmMA3XrZ
 XK1wGkb0h17gZ1ESfjR9PvDRvzMwIDKziebQ3kta9OeOrs4hc74K3Te77JIK3HRTgDl6
 qQ1wi1bikiLPSKhRpb3gpkpJR0YTBimIc2s0rqJqhSP77w3a0pQ7vR4eSMKRlbp5En0p
 4Fhw==
Subject: Re: [PATCH 2/2] count_stat_eventual: Add READ_ONCE() to protect
 global shared variable stopflag
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-3-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <82836fa2-dda7-8f20-a686-29b44ece3469@gmail.com>
Date: Sun, 14 May 2017 19:57:50 +0900
MIME-Version: 1.0
In-Reply-To: <1494515022-30278-3-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Jason & Paul,

So, here is a comment regarding 2/2 of this patch set.
I'm aware that this patch only touches slow path, but anyway...

On 2017/05/11 23:03:42 +0800, Junchang Wang wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
>  CodeSamples/count/count_stat_eventual.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index cbde4aa..2caebfd 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -40,15 +40,15 @@ void *eventual(void *arg)
>  	int t;
>  	unsigned long sum;
>  
> -	while (stopflag < 3) {
> +	while (READ_ONCE(stopflag) < 3) {
>  		sum = 0;
>  		for_each_thread(t)
>  			sum += READ_ONCE(per_thread(counter, t));
>  		WRITE_ONCE(global_count, sum);
>  		poll(NULL, 0, 1);
> -		if (stopflag) {
> +		if (READ_ONCE(stopflag)) {
>  			smp_mb();
> -			stopflag++;
> +			WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);

If I'm reading this correctly, the smp_mb() is to ensure the ordering of write
to global_count and write to stopflag.  This "if" branch is taken after
count_cleanup()'s update of stopflag is observed.  After the update,
only the "eventual()" thread updates stopflag. So, the READ_ONCE() within
the WRITE_ONCE() is not necessary.
To make the locality obvious, it might be better to hold the value in an auto
variable.
Here is my version of the entire eventual() function. Note that read of stopflag
is not necessary at the beginning of the while loop.

void *eventual(void *arg)
{
	int t;
	unsigned long sum;
	int stopflag_l = 0;

	while (stopflag_l < 3) {
		sum = 0;
		for_each_thread(t)
			sum += READ_ONCE(per_thread(counter, t));
		WRITE_ONCE(global_count, sum);
		poll(NULL, 0, 1);
		if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
			smp_mb();
			WRITE_ONCE(stopflag, ++stopflag_l);
		}
	}
	return NULL;
}

>  		}
>  	}
>  	return NULL;
> @@ -66,8 +66,9 @@ void count_init(void)
>  
>  void count_cleanup(void)
>  {
> -	stopflag = 1;
> -	while (stopflag < 3)
> +	WRITE_ONCE(stopflag, 1);
> +	smp_mb();

Is this extra smp_mb() really necessary?
We'll loop until stopflag becomes 3 anyway, we can rely on memory coherency
for the updated value to propagate.

> +	while (READ_ONCE(stopflag) < 3)
>  		poll(NULL, 0, 1);
>  	smp_mb();

This smp_mb() pairs with the smp_mb() in eventual() and ensures the value of
global_count to be read in read_count() is the one written preceding the
update of stopflag.

Am I reading right?

                       Thanks, Akira

>  }
> 

