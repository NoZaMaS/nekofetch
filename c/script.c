#include <stdio.h>
#include <curl/curl.h>

int main()
{
  CURL *curl;
  CURLcode res;
  
  curl = curl_easy_init();
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, "https://api.waifu.pics/sfw/neko");

    res = curl_easy_perform(curl);

    if(res != CURLE_OK)
    {
      fprintf(stderr, "curl_easy_perform() failed\n");
      return 1;
    }

    curl_easy_cleanup(curl);
  }
  return 0;
}


