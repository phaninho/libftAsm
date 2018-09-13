#include <iostream>
#include <fcntl.h>

extern "C"
{
	void	ft_bzero(void *s, size_t n);
	char	*ft_strdup(const char *s1);
	void *ft_memset(void *mem, int c, size_t len);
	void *ft_memcpy(void *dest, const void *src, size_t len);
	int ft_isalnum(int c);
	char *ft_strcat(char *dest, const char *src);
	int	ft_strlen(const char *s);
	int	ft_toupper(int c);
	int	ft_tolower(int c);
	int ft_isalpha(int c);
	int ft_isascii(int c);
	int	ft_isprint(int c);
	int	ft_isalnum(int c);
	int	ft_isdigit(int c);
	int ft_puts(const char *str);
	void ft_cat(int fd);
    void ft_putstr_len(const char* str, size_t len);
	char *ft_strchr(char *str, char c);
	int	ft_strchr_len(char *str, char c);
	char *ft_memalloc(int i);
	void ft_putchar(char c);
}

int main(int ac, char **av)
{
	char *a = ft_strdup("hello");
	char *s = ft_memalloc(42);
	for (int i = 0; i < 42; i++)
	{
		s[i] = 'a';
		ft_putchar('a');
		// ft_putstr_len(&s[i - 1], 1);
	}
	s[41] = '\0';
	ft_putchar('b');
	std::cout << "test memalloc(42) => " << s << std::endl;
	free(s);

	std::cout << "strchr cherche e dans hello => " << ft_strchr(a, 'e') << std::endl;
	std::cout << "strchr_len cherche e dans hello => " << ft_strchr_len(a, 'e') << std::endl;

	ft_puts("\ntest de la fonction ft_puts avec une variable qui s'est faite strdup\n");
	ft_puts(a);
	ft_memset(a, 'z', 2);
	std::cout << "after memset => " << a << " toupper " << (char)ft_toupper(*a) << " len = " << ft_strlen(a) << std::endl;

	std::cout << *a << " is:" << std::endl;
	if (ft_isalnum(*a))
		std::cout << "isalnum " << std::endl;
	else
		std::cout << "is not alnum " << std::endl;
	if (ft_isalpha(*a))
		std::cout << "isalpha " << std::endl;
	else
		std::cout << "is not alpha " << std::endl;
	if (ft_isascii(*a))
		std::cout << "isascii " << std::endl;
	else
		std::cout << "is not ascii " << std::endl;
	if (ft_isprint(*a))
		std::cout << "isprint " << std::endl;
	else
		std::cout << "is not print " << std::endl;
	if (ft_isdigit(*a))
		std::cout << "isdigit " << std::endl;
	else
		std::cout << "is not digit " << std::endl;

	void *b = ft_strdup("abcde");
	std::cout << "avant memcpy b = " << (char *)b << std::endl;
	b = ft_memcpy(ft_strdup("abcde"), a, ft_strlen(a));
	std::cout << "memcpy b = [" << (char*)b << "] and a = " << a << std::endl;

	ft_bzero(a, ft_strlen(a));
	std::cout << "bzero de a" << a << '|'<< std::endl;

	if (ac == 2)
	{
		int fd = open(av[1], O_RDONLY);
		std::cout << "fonction cat => \n"<< std::endl;
		ft_cat(fd);
	}
	else
		std::cout << "ajouter un argument pour tester la fonction cat" << std::endl;
	free(a);
	free(b);
	return 0;
}
